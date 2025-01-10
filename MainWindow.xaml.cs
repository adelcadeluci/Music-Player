using LibVLCSharp.Shared;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Threading;

namespace Music_Player
{
    //wave
    public class WaveBar : INotifyPropertyChanged
    {
        private double height;

        private readonly Random random = new Random();
        public double Height
        {
            get => height;
            set
            {
                if (height != value)
                {
                    height = value;
                    OnPropertyChanged(nameof(Height));
                }
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(string name)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(name));
        }

        // Menambahkan noise untuk efek lebih natural
        public void UpdateHeight(double targetHeight, double smoothing)
        {
            double noise = (random.NextDouble() - 0.5) * 5;
            Height = height + (targetHeight + noise - height) * smoothing;
        }

    }

    public partial class MainWindow : Window
    {
        private static readonly List<string> list = new List<string>();
        private readonly List<string> playlist = list;
        private int currentSongIndex = 0;
        private bool isPlaying = false;
        private readonly System.Windows.Threading.DispatcherTimer timer = new System.Windows.Threading.DispatcherTimer();
        private readonly LibVLC _libVLC;
        private readonly LibVLCSharp.Shared.MediaPlayer _mediaPlayer; // Gunakan namespace eksplisit
        private readonly string radioUrl = "https://sukmben.radiogentara.com/radio/8140/stream";
        //wave
        private readonly List<WaveBar> waveBars;
        private readonly Random random;
        private readonly DispatcherTimer waveTimer;
        //disk animasi
        private Storyboard diskStoryboard;
        private bool isDiskAnimating = false;




        public MainWindow()
        {
            InitializeComponent();
            LoadMusicFromFolder();
            DisplayPlaylist();
            timer.Interval = TimeSpan.FromSeconds(1);
            timer.Tick += Timer_Tick;
            //disk animasi
            CreateDiskAnimation();
            DiskRotateTransform.Angle = 0; // Set posisi awal
            // Inisialisasi LibVLC
            Core.Initialize(@"C:\Program Files (x86)\VideoLAN\VLC\"); // Ubah ke lokasi folder VLC yang valid
            _libVLC = new LibVLC();
            _mediaPlayer = new LibVLCSharp.Shared.MediaPlayer(_libVLC)
            {
                Volume = 40
            };

            // Tunggu sebentar agar UI selesai di-load, lalu mulai musik
            Dispatcher.BeginInvoke(new Action(() =>
            {
                LoadSong(); // Ini akan memanggil PlayMusic()
            }), DispatcherPriority.Loaded);

            //wave
            // Inisialisasi wave bars
            random = new Random();
            waveBars = new List<WaveBar>();
            for (int i = 0; i < 40; i++)
            {
                waveBars.Add(new WaveBar { Height = 5});
            }
            WaveVisualizer.ItemsSource = waveBars;

            // Setup timer untuk animasi
            waveTimer = new DispatcherTimer
            {
                Interval = TimeSpan.FromMilliseconds(666)
            };
            waveTimer.Tick += WaveTimer_Tick;




        }

        //button control window

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void ToggleMaximizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = this.WindowState == WindowState.Maximized ? WindowState.Normal : WindowState.Maximized;
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void Border_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                this.DragMove();
            }
        }


        //Main Musik

        private void MediaPlayer_MediaEnded(object sender, RoutedEventArgs e)
        {
            ResetArmPosition();
            isPlaying = false;
            PlayPauseIcon.Kind = MahApps.Metro.IconPacks.PackIconMaterialKind.Play;
        }

        private void LoadMusicFromFolder()
        {
            try
            {
                string musicFolder = Environment.GetFolderPath(Environment.SpecialFolder.MyMusic);

                string[] musicFiles = Directory.GetFiles(musicFolder, "*.*", SearchOption.AllDirectories)
                                               .Where(file => new[] { ".mp3", ".wav", ".wma" }.Contains(Path.GetExtension(file).ToLower()))
                                               .ToArray();

                foreach (string file in musicFiles)
                {
                    if (!playlist.Contains(file)) // Hindari duplikasi
                    {
                        playlist.Add(file);
                    }
                }

                if (playlist.Any())
                {
                    currentSongIndex = 0;
                    LoadSong();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error loading music: {ex.Message}");
            }
        }

        private void OpenFileButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog
            {
                Filter = "Audio Files|*.mp3;*.wav;*.wma",
                Multiselect = true
            };

            if (openFileDialog.ShowDialog() == true)
            {
                foreach (var fileName in openFileDialog.FileNames)
                {
                    if (!playlist.Contains(fileName))
                    {
                        playlist.Add(fileName);
                    }
                }

                DisplayPlaylist();
            }
        }

        private void DisplayPlaylist()
        {
            PlaylistPanel.Children.Clear();

            for (int i = 0; i < playlist.Count; i++)
            {
                Button songButton = new Button
                {
                    Content = Path.GetFileNameWithoutExtension(playlist[i]),
                    Tag = i,
                    Style = (Style)FindResource("PlaylistItemStyle")
                };

                songButton.Click += (s, e) =>
                {
                    currentSongIndex = (int)((Button)s).Tag;
                    LoadSong();
                };

                PlaylistPanel.Children.Add(songButton);
            }
        }

        private void LoadSong()
        {
            if (playlist.Count > 0 && currentSongIndex >= 0 && currentSongIndex < playlist.Count)
            {
                mediaPlayer.Source = new Uri(playlist[currentSongIndex]);
                SongTitleTextBlock.Text = Path.GetFileNameWithoutExtension(playlist[currentSongIndex]);
                ArtistTextBlock.Text = "Unknown Artist";
                // Mulai pemutaran dan animasi
                PlayMusic();
            }
        }

        private void PlayPauseButton_Click(object sender, RoutedEventArgs e)
        {
            if (isPlaying)
            {
                // Pause: Hentikan animasi vinyl dan arm
                PauseDiskAnimation();
                // Animasi arm kembali ke posisi awal
                ResetArmPosition();

                // Pause media
                mediaPlayer.Pause();

                isPlaying = false;
                PlayPauseIcon.Kind = MahApps.Metro.IconPacks.PackIconMaterialKind.Play;
            }
            else
            {

                // Mulai animasi vinyl
                StartDiskAnimation();
                // Animasi arm ke posisi play
                AnimateArmToPlayPosition();

                // Mainkan media
                mediaPlayer.Play();



                isPlaying = true;
                PlayPauseIcon.Kind = MahApps.Metro.IconPacks.PackIconMaterialKind.Pause;
            }
        }

        private void StopMusicButton_Click(object sender, RoutedEventArgs e)
        {
            // Stop: Hentikan media
            mediaPlayer.Stop();

            // Hentikan animasi vinyl
            StopDiskAnimation();
            // Animasi arm kembali ke posisi awal
            ResetArmPosition();

            isPlaying = false;
            PlayPauseIcon.Kind = MahApps.Metro.IconPacks.PackIconMaterialKind.Play;
        }

        private void NextSongButton_Click(object sender, RoutedEventArgs e)
        {
            if (playlist.Count == 0) return;
            currentSongIndex = (currentSongIndex + 1) % playlist.Count;
            LoadSong();
      
        }

        private void ProgressSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (mediaPlayer.NaturalDuration.HasTimeSpan)
            {
                mediaPlayer.Position = TimeSpan.FromSeconds(e.NewValue);
            }
        }
        private void Timer_Tick(object sender, EventArgs e)
        {
            if (mediaPlayer.Source != null && mediaPlayer.NaturalDuration.HasTimeSpan)
            {
                ProgressSlider.Maximum = mediaPlayer.NaturalDuration.TimeSpan.TotalSeconds;
                ProgressSlider.Value = mediaPlayer.Position.TotalSeconds;
                CurrentTimeText.Text = mediaPlayer.Position.ToString(@"mm\:ss");
                TotalTimeText.Text = mediaPlayer.NaturalDuration.TimeSpan.ToString(@"mm\:ss");
            }
        }

        private void SliderVolume_PreviewMouseDown(object sender, MouseButtonEventArgs e)
        {
            if (sender is Slider slider)
            {
                // Hitung posisi klik relatif terhadap slider
                Point clickPosition = e.GetPosition(slider);

                // Hitung posisi relatif dalam slider (nilai antara 0 hingga 1)
                double relativePosition = clickPosition.X / slider.ActualWidth;

                // Hitung nilai baru berdasarkan posisi relatif
                double newValue = slider.Minimum + (slider.Maximum - slider.Minimum) * relativePosition;

                // Setel nilai slider sesuai posisi yang diklik
                slider.Value = newValue;

                // Perbarui volume MediaPlayer
                if (mediaPlayer != null)
                {
                    mediaPlayer.Volume = newValue;
                }
            }
        }

        private void VolumeSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (mediaPlayer != null)
            {
                mediaPlayer.Volume = SliderVolume.Value;
            }
        }

        // Tombol untuk membuka UI Radio
        private void RadioButton_Click(object sender, RoutedEventArgs e)
        {
            MainUI.Visibility = Visibility.Collapsed; // Sembunyikan tampilan utama
            RadioUI.Visibility = Visibility.Visible;  // Tampilkan tampilan radio
        }

        //  Play dan Animasi Metd
        private void PlayMusic()
        {
            mediaPlayer.Play();
            isPlaying = true;
            timer.Start();
            PlayPauseIcon.Kind = MahApps.Metro.IconPacks.PackIconMaterialKind.Pause;
            StartDiskAnimation(); // Mulai animasi vinyl
            AnimateArmToPlayPosition(); // Animasi arm

        }

        //Animasi
        private void CreateDiskAnimation()
        {
            diskStoryboard = new Storyboard();

            DoubleAnimation rotateAnimation = new DoubleAnimation
            {
                From = 0,
                To = 360,
                Duration = TimeSpan.FromSeconds(3),
                RepeatBehavior = RepeatBehavior.Forever
            };

            Storyboard.SetTargetName(rotateAnimation, "DiskRotateTransform");
            Storyboard.SetTargetProperty(rotateAnimation, new PropertyPath(RotateTransform.AngleProperty));

            diskStoryboard.Children.Add(rotateAnimation);
        }

        private void StartDiskAnimation()
        {
            if (diskStoryboard != null)
            {
                isDiskAnimating = true;
                diskStoryboard.Begin(this, true);
            }
        }

        private void PauseDiskAnimation()
        {
            if (diskStoryboard != null && isDiskAnimating)
            {
                isDiskAnimating = false;
                diskStoryboard.Pause(this);
            }
        }

        private void StopDiskAnimation()
        {
            if (diskStoryboard != null)
            {
                isDiskAnimating = false;
                diskStoryboard.Stop(this);
                DiskRotateTransform.Angle = 0;
            }
        }

        private void ResetArmPosition()
        {
            if (ArmRotateTransform != null)
            {
                // Buat animasi untuk mengembalikan arm ke posisi awal (sudut 0)
                DoubleAnimation resetAnimation = new DoubleAnimation
                {
                    To = 0, // Kembali ke sudut awal
                    Duration = TimeSpan.FromSeconds(1), // Durasi animasi
                    EasingFunction = new CubicEase { EasingMode = EasingMode.EaseOut }
                };

                // Jalankan animasi pada properti sudut
                ArmRotateTransform.BeginAnimation(RotateTransform.AngleProperty, resetAnimation);
            }
        }

        private void AnimateArmToPlayPosition()
        {
            // Pastikan arm bergerak ke posisi yang benar saat mulai diputar
            DoubleAnimation armAnimation = new DoubleAnimation
            {
                From = 0,  // Sudut awal (0 derajat)
                To = 31.539,  // Posisi arm untuk play
                Duration = TimeSpan.FromSeconds(1),
                AutoReverse = false  // Jangan balikkan animasi
            };

            // Terapkan animasi pada rotasi arm
            ArmRotateTransform.BeginAnimation(RotateTransform.AngleProperty, armAnimation);
        }


        //Radio
        private void WaveTimer_Tick(object sender, EventArgs e)
        {
            if (isPlaying && _mediaPlayer.IsPlaying)
            {
                foreach (var bar in waveBars)
                {
                    bar.Height = random.Next(20, 100); // Ubah range sesuai kebutuhan
                }
            }
            else
            {
                foreach (var bar in waveBars)
                {
                    bar.Height = 10;
                }
            }
        }

        private void PlayButtonRadio_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!_mediaPlayer.IsPlaying)
                {
                    var media = new Media(_libVLC, radioUrl, FromType.FromLocation);
                    _mediaPlayer.Play(media);
                    _mediaPlayer.Volume = (int)RadioVolumeSlider.Value;
                    isPlaying = true;
                    waveTimer.Start(); // Mulai animasi
                    mediaPlayer.Stop();// Stop: Hentikan media
                    ResetArmPosition();// rest arm vinyl
                    StopDiskAnimation();// vinyl animation
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Error: {ex.Message}", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void StopButtonRadio_Click(object sender, RoutedEventArgs e)
        {
            if (_mediaPlayer.IsPlaying)
            {
                _mediaPlayer.Stop();
                isPlaying = false;
                waveTimer.Stop(); // Hentikan animasi

                // Reset bars
                foreach (var bar in waveBars)
                {
                    bar.Height = 10;
                }
            }
        }

        protected override void OnClosed(EventArgs e)
        {
            _mediaPlayer?.Dispose();
            _libVLC?.Dispose();
            StopDiskAnimation();
            diskStoryboard = null;
            base.OnClosed(e);
        }

        private void RadioVolumeSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (_mediaPlayer != null)
            {
                _mediaPlayer.Volume = (int)e.NewValue;
            }
        }



        // Tombol untuk kembali ke UI utama
        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            RadioUI.Visibility = Visibility.Collapsed; // Sembunyikan tampilan radio
            MainUI.Visibility = Visibility.Visible;    // Tampilkan tampilan utama
                                                       // Radio Stop
            _mediaPlayer.Stop();
        }

    }
}
