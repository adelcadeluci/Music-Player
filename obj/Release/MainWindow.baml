   M S B A M L   `   `   `  ����   Music Player    Music_Player.MainWindow   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     g cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ac _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:icon-http://metro.mahapps.com/winfx/xaml/iconpacks   $	��700��$
��1050��  � 
ResizeMode$  CanResizeWithGrip=� � AllowsTransparency .  � WindowStartupLocation$ CenterScreen=� � WindowStyle$
 None=�
������ .���� -   
������� �� CornerRadius$	 40 ��$��20q�$��Stretch=�$��Stretch=� J� Effect 3  -System.Windows.Media.Effects.DropShadowEffect     Color$ Black��   
BlurRadius$ 15Q�   ShadowDepth$ 5Q�	   Opacity$		 0.5Q�._�� .+�� -   
 �Name$
 MainUI��$y�	Collapsed=� � RowDefinitions �� $
��Auto ��� �� $
��Auto � � ColumnDefinitions �� $
��Auto �$	��390���� $
��Auto ��� $��* �.+��� 
��� � �$ 	40 40 0 0��$��3��$��Center=�$��Stretch=�$��53��._��� $��Center=�$��0,11,0,0q�$	��Top=�$
��1010��.+��� $��Music Player��$��Center=�$��Bottom=�$��10(�$
��Bold"�$��
10 4 10 10q�� 
������ $��1��$��2��$��1��$��	0,0,0,115q�.+�A� -    A�Name$ ImageEllipse��$	��280��$	��280��$��Center=�$��Center=�z��� -   DiskRotateTransform�� �� CenterX$	 140Q� �� CenterY$	 140Q�����  �� ImageSource$ /Images/vinyl.png�� j� Stretch$ Uniform=�� $��Center=�$��Center=�.+��� -    ��Name$ ArmImage��$��/Images/arm.png��$��52��$	��200�� J� RenderTransformOrigin$ 0.529,0.109&�$��247,-125,-107,-5q�z�V� .~��� -   ArmRotateTransform�� �� Angle$ 0Q� � Triggers :�  :� RoutedEvent$ Loaded��.[��� .���� .��W�  �� 
TargetName$ DiskRotateTransform�� �� TargetProperty$ Angle� W� From$ 0X�	 W� To$	 360X� g� Duration$ 0:0:5D� g� RepeatBehavior$ Forever��W� $ ArmRotateTransform��$ Angle�$ 0X�$ 31.539X�$ 0:0:1D� g� 	BeginTime$ 0:0:1X�� .+���  �� Orientation$ 
Horizontal=�$
��Left=�$��
30 20 0 20q�$��66��.+��� -   $��13��$��13������  �� 
TargetType" ��.R�A� ���#ff6258$��13��$��13��A� 
������ $��13��$��13���� -   $��13��$��13������ " ��.R�A� ���#ffbf2f$��13��$��13��A� 
������ $��13��$��13���� -	   $��13��$��13������ " ��.R�A� ���#2acb42$��13��$��13��r� -
   $��mediaPlayer��  r� LoadedBehavior$  Manual=�! r� UnloadedBehavior$
! Stop=�$��-387,-53,-11,93q�" r� Stretch$" UniformToFill=��� $ 40 40 40 40��$��Center=�$	��331��$��1��$��
0,15,0,125q�# J� Opacity$# 4Q�$ �� Padding$$ 4,0,0,0q�$��Center=����� $ /images/m1.JPG��$ UniformToFill=�   $ Black��$ 60Q�$ 5Q�$		 0.5Q�._��� $��20 30q�.+��� $��SAYA KAN 2 ORANG��$��20(�$��Regular"�
��������� -      
menuButton#��[  $��10 12 10 20q����	#66707070���	#66D3D3D3.���� $ 
Horizontal=�.+�.  (MahApps.Metro.IconPacks.PackIconMaterial  %   Kind$% 
FolderOpen=�  menuButtonIcon#��[ �� $��	Open File��
�������r� -   & r�Name$& RadioMediaElement��$  Manual=�$
! Stop=�' r� Volume$	' 0.5Q�$y�	Collapsed=��� -   #��[  $��10 12 10 20q����	#66707070���	#66FF0000.���� $ 
Horizontal=�.+�  $% Radio=�#��[ �� $��Radio Tel-U��
���   ��� $��Playlist��$��22(�$
��Bold"�$��10 10q�
�������� 
������ $��0��$��1��$��
10,5,20,10q�$	��736�� �� $	��29* ��� $
��100* �.+�r� -   $��scroll��$  Manual=�$
! Stop=�$��10,20,10,716q�$" UniformToFill=�$��2���� -   $��PlaylistScrollViewer��$��Hidden=�
���   �$��2��.���� -   $��PlaylistPanel��
������ $	��Top=��� $��1��$��3�����#03bf69$ 	0 75 0 40��$��Bottom=�$	��115��$��0,0,85,0q�._��� $��Stretch=�$��Stretch=�$
��Auto��$
��Auto��.+�� $��45��$ 0.902,0.681&�$��
30,0,30,10q�.+��� $ Vertical=�$��
0,10,0,-15q�.+��� -   ( ��Name$( SongTitleTextBlock��$��No Song Loaded��
�������$��16(�$
��Bold"��� -   $( ArtistTextBlock��$��-�����#9ae5c3$��14(�� $��
30,0,30,10q� �� $
��Auto ��� $
��Auto ��� $
��Auto ��� $��* ��� $
��Auto ��� $
��Auto �.+��� -   ) ��Name$) PlayPauseButton��$��0��  playerButton#��[ $��5q�.��  -   *  Name$* PlayPauseIcon��$% 	PlayPause=�  playerButtonIcon#��[ �� -   $��1��#��[ $��5q�.��  $% SkipNext=�#��[ �� -   $��2��#��[ $��5q�.��  $
% Stop=�#��[ �� -   + ��Name$+ ProgressSlider��$��3��, � Value$, 0Q�- � Minimum$- 0Q�. � Maximum$	. 100Q�$��	10,5,10,5q�$��Center=�/ �� IsMoveToPointEnabled/ . ��Z� �� $��4��$ Vertical=�$��Center=�.+��� -   $( CurrentTimeText��$
��0:00��$��Center=�
��������� -   $( TotalTimeText��$
��0:00��$��Center=�
��������� -   $+ SliderVolume��$��5��$- 0Q�$. 1Q�$	, 0.2Q�$��10,0,0,0q�$��Center=�$	��150��� -   $
 RadioUI��$y�Visible=�.+��  �� $
��Auto ��� �� $
��Auto � �� $
��Auto �$	��390���� $
��Auto ��� $��* �.+��� 
�������$ 	40 40 0 0��$��3��$��Center=�$��Stretch=�$��53��._��� $��Center=�$��0,11,0,0q�$	��Top=�$
��1010��.+��� $��Music Player��$��Center=�$��Bottom=�$��10(�$
��Bold"�$��
10 4 10 10q�� .+��� $ 
Horizontal=�$
��Left=�$��
30,15,0,15q�$	��269��.+��� -   $��13��$��13������ " ��.R�A� ���#ff6258$��13��$��13��A� 
������ $��13��$��13���� -   $��13��$��13������ " ��.R�A� ���#ffbf2f$��13��$��13��A� 
������ $��13��$��13���� -   $��13��$��13������ " ��.R�A� ���#2acb42$��13��$��13��A� 
������ $��13��$��13���� -   $��Back to Home��$��19��$	��174��(� 0 (� Stretch$0 Uniform=�$��10,60,10,56q�.��� .+��� -    $ BackgroundImage��$��/images/radio.jpg��$
��Fill=��� $
��Play��$��40(�$
��Bold"�$��815,572,1055,468q�$ 0.5,0.5&�z�V� .~��� �� �� $ -2.064Q�T� �� $
��Stop��$��40(�$
��Bold"�$��1007,657,863,382q�$ 0.5,0.5&�z�V� .~��� �� �� $ -2.064Q�T� �� -!     playerRadioButton#��[ $	��Top=�$��Center=�$��-250,630,0,0q�$��87��$��87��.��  $% SkipNext=�$# 0Q�  playerRadioButtonIcon#��[ $��65��$��65���� -"   #��[ $	��Top=�$��Center=�$��140,720,0,0q�$��87��$��87��.��  $% SkipNext=�$# 0Q�#��[ $��65��$��65��