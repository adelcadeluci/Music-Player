   M S B A M L   `   `   `  ����   Music Player+    %Music_Player.UserControls.PopularSong   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     -   $��popularSong��.���� -     ��Name$  border�� �� CornerRadius$ 30�� �� Padding$ 10q�$	��0 7q�����  �� 
TargetType" ��.���  �� Property � �� �� Value �#ecf4f0 �� Triggers P�  P� Property �@J�IsMouseOver P� Value . . ���  � �� �#03bf69�� 	 �� Binding	 �� 
 �� ElementName$
 popularSong�� �� Path$ IsActive� �� Value True.a���  � �� �#03bf69._��  � ColumnDefinitions �� $
��auto ��� $	��180 ��� $��* �.+�A� $��40��$��40��$��0 0 20 0q�����  �� ImageSource �� $
 popularSong��$ Image��� $��16(�$��SemiBold"�$��1��$��Center=�$��0 0 0 2q����� $
 popularSong��$ Title����� " ��.���  � �� �#787c7a �� 	 �� $
 border��$ IsMouseOver� true.a���  � ��
 ������� 	 �� $
 popularSong��$ IsActive� true.a���  � ��
 ������� 	 �� $
 border��$ IsMouseOver� true.a���  � ��
 ������� $��14(�$��SemiBold"�$��2��$��Center=�$��0 0 20 2q�$��Right=����� $
 popularSong��$
 Time�