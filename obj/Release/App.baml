   M S B A M L   `   `   `  ����   Music Player    Music_Player.App   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     g cMahApps.Metro.IconPacks.Material, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137ac _MahApps.Metro.IconPacks.Core, Version=5.0.0.0, Culture=neutral, PublicKeyToken=0c0d510f9915137a:icon-http://metro.mahapps.com/winfx/xaml/iconpacks     �� 	Resources     	menuTitle �� 
TargetType �� Property �� Value  
menuButton �� 
TargetType �� CornerRadius �� Triggers P� Property P� Value  PlaylistItemStyle	 �� Orientation  menuButtonIcon.  (MahApps.Metro.IconPacks.PackIconMaterial
 �� Path �� RelativeSource �� AncestorType  	titleText  playerButton  playerButtonIcon  playerRadioButton  playerRadioButtonIcon 	 RepeatButtonTransparent !
 SliderThumb.Static.Background �� Color  SliderThumb.Static.Border ! SliderThumb.Static.Foreground $  SliderThumb.MouseOver.Background   SliderThumb.MouseOver.Border " SliderThumb.Pressed.Background  SliderThumb.Pressed.Border # SliderThumb.Disabled.Background  SliderThumb.Disabled.Border   SliderThumb.Track.Background  SliderThumb.Track.Border   SliderThumbHorizontalDefault � UseLayoutRounding F�Name J� SnapsToDevicePixels �� Stretch �� Triggers �� 
TargetName  SliderThumbHorizontalTop  SliderThumbHorizontalBottom A�Name �� Opacity  SliderHorizontal ��Name � RowDefinitions m�Name m� Fill m� 	Placement ]�Name ]� DecreaseRepeatButton �� DecreaseLarge ]� IncreaseRepeatButton �� IncreaseLarge  ]� Thumb! n�Name" � OverridesDefaultStyle  SliderStyle1��%  &	        &	 u     &	 A    &	 c    &	 #    &	 z    &	 �    &	 1    &	 �    &		 �    &	
 �    &	 �    &	 �    &	 �    &	 �    &	 	    &	 	    &	 ,	    &	 A	    &	 V	    &	 k	    &	 �	    7 
 7  7  7  7  7  7  7  &	 q    7 
 7  7  7  7  7  7  7  &	 �    &	     7 	 7 	 7  7  7  &	 �    7  7  �� " ��.���  � �� �#97e6c1��  � ��$ 22(���  � ��$
 Bold"���  � ��$ 
63 30 0 15q��� " ��.���  � �� �#d3d3d3��  � ��
 �   ���  � ��$ 50����  � ��$ 30 3 0 3q���  � ��$ 18(���  � ��$
 Bold"���  �@�FocusVisualStyle Z� ��  �@�Tag$ 	Collapsed����  � �� �� " ��.R��� #��z��$ 25��._��� $��Stretch=�$��Center=�$��35 0 0 0q� P�  �@J�IsMouseOver . . ���  � �� �#02be68��  � �� �#ffffff��  �@�Tag$ Visible���� " ��.���  � ��$ 1q���  � ��$ 10q���  � ��$ 18(���  � ��
 ���� ��  � ��
 ���� ��  � ��
 ���� ��  � ��$
 Left=���  � �� �� " ��.R��� ._��� $	 
Horizontal=�$��5q�.+��� #��z��$��Center=�$��14(�
��������� "  .���  � ��$ Center=���  � ��$ 0 0 23 0q���  �@ Kind$ ChevronRight=���  � ��$ Right=���  � y� �� $	
 Tag� �� *FindAncestor+" ���� " ��.���  � �� �#393939��  � ��$ 36(���  � ��$
 Bold"��� " ��.���  � ��
 ���� ��  � �� �#ffff��  � ��$ 40����  � ��$ 40����  � ��$	 3 0q���  �@�FocusVisualStyle Z� ��  �@�Tag$ 	Collapsed����  � �� �� " ��.R��� #��z��$ 50��._��� $��Center=�$��Center=� P�  �@J�IsMouseOver . . ���  � �� �#00a85b��  � �� �#f0f0f0�� "  .���  � ��$ 17����  � ��$ 17���� " ��.���  � ��
 ���� ��  � �� �#ffff��  � ��$ 40����  � ��$ 40����  � ��$	 3 0q���  �@�FocusVisualStyle Z� ��  �@�Tag$ 	Collapsed����  � �� �� " ��.R��� #��z��$ 50��._��� $��Center=�$��Center=� P�  �@J�IsMouseOver . . ���  � �� �	#66FFBC06��  � �� �#f0f0f0�� "  .���  � ��$ 17����  � ��$ 17���� " ��.���  �@�OverridesDefaultStyle . ��  � ��
 ���� ��  � |� .  ��  � �� .  ��  � �� �� " ��.R��� #��z��#��z��#��z���� $ 	#FFF0F0F0���� $ 	#FFACACAC���� $ 	#FFE5E5E5���� $ 	#FFDCECFC���� $ 	#FF7Eb4EA���� $ 	#FFDAECFC���� $ 	#FF569DE5���� $ 	#FFF0F0F0���� $ 	#FFD9D9D9���� $ 	#FFE7EAEA���� $ 	#FFD6D6D6���� " n�.R�� $��Center=� . $��Center=�.+�F� $
 grip��d����        �        �ا �ا ��ا     �ا ���ا ����ا �������    ��	8��  8��  . $
 Fill=�$��1�� . $��Center=� P�  �@J�IsMouseOver . . ��� $
 grip��8   � ���� $
 grip��8   � ��P�  �@n�
IsDragging . . ��� $
 grip��8   � ���� $
 grip��8   � ��P�  � {� .  . ��� $
 grip��8   � ���� $
 grip��8   � ���� " n�.R�� $��Center=� . $��Center=�.+�F� $
 grip�������    ��[ �    ��[ `�S `�S �`�S     �ا ��[ �ا ��[ ��ا ��[ �ا ���ا ����ا �������    ����[ ��[ 	8��  8��  . $
 Fill=�$��1�� . $��Center=� P�  �@J�IsMouseOver . . ��� $
 grip��8   � ���� $
 grip��8   � ��P�  �@n�
IsDragging . . ��� $
 grip��8   � ���� $
 grip��8   � ��P�  � {� .  . ��� $
 grip��8   � ���� $
 grip��8   � ���� " n�.R�� $��Center=� . $��Center=�.+�A� $
 grip��$��30��$��30��$��10�����#ffffff���� $ #87e4c1��$	 0.5Q��� " ��.R��� $ border��#��z��#��z��#��z�� . ._��  �� $
��Auto ��� $
��Auto �#��z���� $
��Auto �.+�m� $ TopTick��# z��$��4��$��0,0,0,2q�$	 Top=�$��0��$y�	Collapsed=�m� $ 
BottomTick��# z��$��4��$��0,2,0,0q�$ Bottom=�$��2��$y�	Collapsed=��� $ TrackBackground�����#49d092$��0q�$	 2.5��$��4��$
��15,0q�$��1��$��center=�._��� $ PART_SelectionRange�����#dbf5e9$ 1��$
��Left=�]� $ 
PART_Track��$��1�� �� #��Z 8��   �� #��Z 8��   n� $! Thumb��|�.  $��30��" . 8�� $��Center=�$��30�� P�  �@��TickPlacement$ TopLeft=�. ��� $ TopTick�� � y�$ Visible=��� $ Thumb��8   � ���� $ TrackBackground�� � ��$ 5,2,5,0q�P�  �@��TickPlacement$ BottomRight=�. ��� $ 
BottomTick�� � y�$ Visible=��� $ Thumb��8   � ���� $ TrackBackground�� � ��$ 5,0,5,2q�P�  �@��TickPlacement$
 Both=�. ��� $ TopTick�� � y�$ Visible=��� $ 
BottomTick�� � y�$ Visible=�P�  �@��IsSelectionRangeEnabled . . ��� $ PART_SelectionRange�� � y�$ Visible=�P�  �@J�IsKeyboardFocused . . ��� $ Thumb�� � ��
 ��  ��� " ��.���  �@��IsPressAndHoldEnabled .  ��  � ��
 ���� ��  � ��
 ���� ��  � ��8   ��  � ��8  ��  �@�FocusVisualStyle Z� 