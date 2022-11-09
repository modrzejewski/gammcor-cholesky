module auto2e_KetTransform_8_8
use arithmetic
implicit none

integer, dimension(45, 45), parameter :: RCopyIdx_8_8 = reshape([1, 18, 34, 49, 63, &
    76, 88, 99, 109, 154, 170, 185, 199, 212, 224, 235, 245, 290, 305, 319, 332, &
    344, 355, 365, 410, 424, 437, 449, 460, 470, 515, 528, 540, 551, 561, 606, 618, &
    629, 639, 684, 695, 705, 750, 760, 805, 18, 34, 49, 63, 76, 88, 99, 109, 118, &
    170, 185, 199, 212, 224, 235, 245, 254, 305, 319, 332, 344, 355, 365, 374, 424, &
    437, 449, 460, 470, 479, 528, 540, 551, 561, 570, 618, 629, 639, 648, 695, 705, &
    714, 760, 769, 814, 34, 49, 63, 76, 88, 99, 109, 118, 126, 185, 199, 212, 224, &
    235, 245, 254, 262, 319, 332, 344, 355, 365, 374, 382, 437, 449, 460, 470, 479, &
    487, 540, 551, 561, 570, 578, 629, 639, 648, 656, 705, 714, 722, 769, 777, 822, &
    49, 63, 76, 88, 99, 109, 118, 126, 133, 199, 212, 224, 235, 245, 254, 262, 269, &
    332, 344, 355, 365, 374, 382, 389, 449, 460, 470, 479, 487, 494, 551, 561, 570, &
    578, 585, 639, 648, 656, 663, 714, 722, 729, 777, 784, 829, 63, 76, 88, 99, 109, &
    118, 126, 133, 139, 212, 224, 235, 245, 254, 262, 269, 275, 344, 355, 365, 374, &
    382, 389, 395, 460, 470, 479, 487, 494, 500, 561, 570, 578, 585, 591, 648, 656, &
    663, 669, 722, 729, 735, 784, 790, 835, 76, 88, 99, 109, 118, 126, 133, 139, &
    144, 224, 235, 245, 254, 262, 269, 275, 280, 355, 365, 374, 382, 389, 395, 400, &
    470, 479, 487, 494, 500, 505, 570, 578, 585, 591, 596, 656, 663, 669, 674, 729, &
    735, 740, 790, 795, 840, 88, 99, 109, 118, 126, 133, 139, 144, 148, 235, 245, &
    254, 262, 269, 275, 280, 284, 365, 374, 382, 389, 395, 400, 404, 479, 487, 494, &
    500, 505, 509, 578, 585, 591, 596, 600, 663, 669, 674, 678, 735, 740, 744, 795, &
    799, 844, 99, 109, 118, 126, 133, 139, 144, 148, 151, 245, 254, 262, 269, 275, &
    280, 284, 287, 374, 382, 389, 395, 400, 404, 407, 487, 494, 500, 505, 509, 512, &
    585, 591, 596, 600, 603, 669, 674, 678, 681, 740, 744, 747, 799, 802, 847, 109, &
    118, 126, 133, 139, 144, 148, 151, 153, 254, 262, 269, 275, 280, 284, 287, 289, &
    382, 389, 395, 400, 404, 407, 409, 494, 500, 505, 509, 512, 514, 591, 596, 600, &
    603, 605, 674, 678, 681, 683, 744, 747, 749, 802, 804, 849, 154, 170, 185, 199, &
    212, 224, 235, 245, 254, 290, 305, 319, 332, 344, 355, 365, 374, 410, 424, 437, &
    449, 460, 470, 479, 515, 528, 540, 551, 561, 570, 606, 618, 629, 639, 648, 684, &
    695, 705, 714, 750, 760, 769, 805, 814, 850, 170, 185, 199, 212, 224, 235, 245, &
    254, 262, 305, 319, 332, 344, 355, 365, 374, 382, 424, 437, 449, 460, 470, 479, &
    487, 528, 540, 551, 561, 570, 578, 618, 629, 639, 648, 656, 695, 705, 714, 722, &
    760, 769, 777, 814, 822, 858, 185, 199, 212, 224, 235, 245, 254, 262, 269, 319, &
    332, 344, 355, 365, 374, 382, 389, 437, 449, 460, 470, 479, 487, 494, 540, 551, &
    561, 570, 578, 585, 629, 639, 648, 656, 663, 705, 714, 722, 729, 769, 777, 784, &
    822, 829, 865, 199, 212, 224, 235, 245, 254, 262, 269, 275, 332, 344, 355, 365, &
    374, 382, 389, 395, 449, 460, 470, 479, 487, 494, 500, 551, 561, 570, 578, 585, &
    591, 639, 648, 656, 663, 669, 714, 722, 729, 735, 777, 784, 790, 829, 835, 871, &
    212, 224, 235, 245, 254, 262, 269, 275, 280, 344, 355, 365, 374, 382, 389, 395, &
    400, 460, 470, 479, 487, 494, 500, 505, 561, 570, 578, 585, 591, 596, 648, 656, &
    663, 669, 674, 722, 729, 735, 740, 784, 790, 795, 835, 840, 876, 224, 235, 245, &
    254, 262, 269, 275, 280, 284, 355, 365, 374, 382, 389, 395, 400, 404, 470, 479, &
    487, 494, 500, 505, 509, 570, 578, 585, 591, 596, 600, 656, 663, 669, 674, 678, &
    729, 735, 740, 744, 790, 795, 799, 840, 844, 880, 235, 245, 254, 262, 269, 275, &
    280, 284, 287, 365, 374, 382, 389, 395, 400, 404, 407, 479, 487, 494, 500, 505, &
    509, 512, 578, 585, 591, 596, 600, 603, 663, 669, 674, 678, 681, 735, 740, 744, &
    747, 795, 799, 802, 844, 847, 883, 245, 254, 262, 269, 275, 280, 284, 287, 289, &
    374, 382, 389, 395, 400, 404, 407, 409, 487, 494, 500, 505, 509, 512, 514, 585, &
    591, 596, 600, 603, 605, 669, 674, 678, 681, 683, 740, 744, 747, 749, 799, 802, &
    804, 847, 849, 885, 290, 305, 319, 332, 344, 355, 365, 374, 382, 410, 424, 437, &
    449, 460, 470, 479, 487, 515, 528, 540, 551, 561, 570, 578, 606, 618, 629, 639, &
    648, 656, 684, 695, 705, 714, 722, 750, 760, 769, 777, 805, 814, 822, 850, 858, &
    886, 305, 319, 332, 344, 355, 365, 374, 382, 389, 424, 437, 449, 460, 470, 479, &
    487, 494, 528, 540, 551, 561, 570, 578, 585, 618, 629, 639, 648, 656, 663, 695, &
    705, 714, 722, 729, 760, 769, 777, 784, 814, 822, 829, 858, 865, 893, 319, 332, &
    344, 355, 365, 374, 382, 389, 395, 437, 449, 460, 470, 479, 487, 494, 500, 540, &
    551, 561, 570, 578, 585, 591, 629, 639, 648, 656, 663, 669, 705, 714, 722, 729, &
    735, 769, 777, 784, 790, 822, 829, 835, 865, 871, 899, 332, 344, 355, 365, 374, &
    382, 389, 395, 400, 449, 460, 470, 479, 487, 494, 500, 505, 551, 561, 570, 578, &
    585, 591, 596, 639, 648, 656, 663, 669, 674, 714, 722, 729, 735, 740, 777, 784, &
    790, 795, 829, 835, 840, 871, 876, 904, 344, 355, 365, 374, 382, 389, 395, 400, &
    404, 460, 470, 479, 487, 494, 500, 505, 509, 561, 570, 578, 585, 591, 596, 600, &
    648, 656, 663, 669, 674, 678, 722, 729, 735, 740, 744, 784, 790, 795, 799, 835, &
    840, 844, 876, 880, 908, 355, 365, 374, 382, 389, 395, 400, 404, 407, 470, 479, &
    487, 494, 500, 505, 509, 512, 570, 578, 585, 591, 596, 600, 603, 656, 663, 669, &
    674, 678, 681, 729, 735, 740, 744, 747, 790, 795, 799, 802, 840, 844, 847, 880, &
    883, 911, 365, 374, 382, 389, 395, 400, 404, 407, 409, 479, 487, 494, 500, 505, &
    509, 512, 514, 578, 585, 591, 596, 600, 603, 605, 663, 669, 674, 678, 681, 683, &
    735, 740, 744, 747, 749, 795, 799, 802, 804, 844, 847, 849, 883, 885, 913, 410, &
    424, 437, 449, 460, 470, 479, 487, 494, 515, 528, 540, 551, 561, 570, 578, 585, &
    606, 618, 629, 639, 648, 656, 663, 684, 695, 705, 714, 722, 729, 750, 760, 769, &
    777, 784, 805, 814, 822, 829, 850, 858, 865, 886, 893, 914, 424, 437, 449, 460, &
    470, 479, 487, 494, 500, 528, 540, 551, 561, 570, 578, 585, 591, 618, 629, 639, &
    648, 656, 663, 669, 695, 705, 714, 722, 729, 735, 760, 769, 777, 784, 790, 814, &
    822, 829, 835, 858, 865, 871, 893, 899, 920, 437, 449, 460, 470, 479, 487, 494, &
    500, 505, 540, 551, 561, 570, 578, 585, 591, 596, 629, 639, 648, 656, 663, 669, &
    674, 705, 714, 722, 729, 735, 740, 769, 777, 784, 790, 795, 822, 829, 835, 840, &
    865, 871, 876, 899, 904, 925, 449, 460, 470, 479, 487, 494, 500, 505, 509, 551, &
    561, 570, 578, 585, 591, 596, 600, 639, 648, 656, 663, 669, 674, 678, 714, 722, &
    729, 735, 740, 744, 777, 784, 790, 795, 799, 829, 835, 840, 844, 871, 876, 880, &
    904, 908, 929, 460, 470, 479, 487, 494, 500, 505, 509, 512, 561, 570, 578, 585, &
    591, 596, 600, 603, 648, 656, 663, 669, 674, 678, 681, 722, 729, 735, 740, 744, &
    747, 784, 790, 795, 799, 802, 835, 840, 844, 847, 876, 880, 883, 908, 911, 932, &
    470, 479, 487, 494, 500, 505, 509, 512, 514, 570, 578, 585, 591, 596, 600, 603, &
    605, 656, 663, 669, 674, 678, 681, 683, 729, 735, 740, 744, 747, 749, 790, 795, &
    799, 802, 804, 840, 844, 847, 849, 880, 883, 885, 911, 913, 934, 515, 528, 540, &
    551, 561, 570, 578, 585, 591, 606, 618, 629, 639, 648, 656, 663, 669, 684, 695, &
    705, 714, 722, 729, 735, 750, 760, 769, 777, 784, 790, 805, 814, 822, 829, 835, &
    850, 858, 865, 871, 886, 893, 899, 914, 920, 935, 528, 540, 551, 561, 570, 578, &
    585, 591, 596, 618, 629, 639, 648, 656, 663, 669, 674, 695, 705, 714, 722, 729, &
    735, 740, 760, 769, 777, 784, 790, 795, 814, 822, 829, 835, 840, 858, 865, 871, &
    876, 893, 899, 904, 920, 925, 940, 540, 551, 561, 570, 578, 585, 591, 596, 600, &
    629, 639, 648, 656, 663, 669, 674, 678, 705, 714, 722, 729, 735, 740, 744, 769, &
    777, 784, 790, 795, 799, 822, 829, 835, 840, 844, 865, 871, 876, 880, 899, 904, &
    908, 925, 929, 944, 551, 561, 570, 578, 585, 591, 596, 600, 603, 639, 648, 656, &
    663, 669, 674, 678, 681, 714, 722, 729, 735, 740, 744, 747, 777, 784, 790, 795, &
    799, 802, 829, 835, 840, 844, 847, 871, 876, 880, 883, 904, 908, 911, 929, 932, &
    947, 561, 570, 578, 585, 591, 596, 600, 603, 605, 648, 656, 663, 669, 674, 678, &
    681, 683, 722, 729, 735, 740, 744, 747, 749, 784, 790, 795, 799, 802, 804, 835, &
    840, 844, 847, 849, 876, 880, 883, 885, 908, 911, 913, 932, 934, 949, 606, 618, &
    629, 639, 648, 656, 663, 669, 674, 684, 695, 705, 714, 722, 729, 735, 740, 750, &
    760, 769, 777, 784, 790, 795, 805, 814, 822, 829, 835, 840, 850, 858, 865, 871, &
    876, 886, 893, 899, 904, 914, 920, 925, 935, 940, 950, 618, 629, 639, 648, 656, &
    663, 669, 674, 678, 695, 705, 714, 722, 729, 735, 740, 744, 760, 769, 777, 784, &
    790, 795, 799, 814, 822, 829, 835, 840, 844, 858, 865, 871, 876, 880, 893, 899, &
    904, 908, 920, 925, 929, 940, 944, 954, 629, 639, 648, 656, 663, 669, 674, 678, &
    681, 705, 714, 722, 729, 735, 740, 744, 747, 769, 777, 784, 790, 795, 799, 802, &
    822, 829, 835, 840, 844, 847, 865, 871, 876, 880, 883, 899, 904, 908, 911, 925, &
    929, 932, 944, 947, 957, 639, 648, 656, 663, 669, 674, 678, 681, 683, 714, 722, &
    729, 735, 740, 744, 747, 749, 777, 784, 790, 795, 799, 802, 804, 829, 835, 840, &
    844, 847, 849, 871, 876, 880, 883, 885, 904, 908, 911, 913, 929, 932, 934, 947, &
    949, 959, 684, 695, 705, 714, 722, 729, 735, 740, 744, 750, 760, 769, 777, 784, &
    790, 795, 799, 805, 814, 822, 829, 835, 840, 844, 850, 858, 865, 871, 876, 880, &
    886, 893, 899, 904, 908, 914, 920, 925, 929, 935, 940, 944, 950, 954, 960, 695, &
    705, 714, 722, 729, 735, 740, 744, 747, 760, 769, 777, 784, 790, 795, 799, 802, &
    814, 822, 829, 835, 840, 844, 847, 858, 865, 871, 876, 880, 883, 893, 899, 904, &
    908, 911, 920, 925, 929, 932, 940, 944, 947, 954, 957, 963, 705, 714, 722, 729, &
    735, 740, 744, 747, 749, 769, 777, 784, 790, 795, 799, 802, 804, 822, 829, 835, &
    840, 844, 847, 849, 865, 871, 876, 880, 883, 885, 899, 904, 908, 911, 913, 925, &
    929, 932, 934, 944, 947, 949, 957, 959, 965, 750, 760, 769, 777, 784, 790, 795, &
    799, 802, 805, 814, 822, 829, 835, 840, 844, 847, 850, 858, 865, 871, 876, 880, &
    883, 886, 893, 899, 904, 908, 911, 914, 920, 925, 929, 932, 935, 940, 944, 947, &
    950, 954, 957, 960, 963, 966, 760, 769, 777, 784, 790, 795, 799, 802, 804, 814, &
    822, 829, 835, 840, 844, 847, 849, 858, 865, 871, 876, 880, 883, 885, 893, 899, &
    904, 908, 911, 913, 920, 925, 929, 932, 934, 940, 944, 947, 949, 954, 957, 959, &
    963, 965, 968, 805, 814, 822, 829, 835, 840, 844, 847, 849, 850, 858, 865, 871, &
    876, 880, 883, 885, 886, 893, 899, 904, 908, 911, 913, 914, 920, 925, 929, 932, &
    934, 935, 940, 944, 947, 949, 950, 954, 957, 959, 960, 963, 965, 966, 968, 969], &
    [45, 45])

contains

subroutine auto2e_RCopy_8_8(T, R, idx)
real(F64), dimension(:), intent(out) :: T
real(F64), dimension(:), intent(in) :: R
integer, dimension(:), intent(in) :: idx
T(1:9) = R(idx(1):idx(1)+8)
T(10:17) = R(idx(2):idx(2)+7)
T(18:24) = R(idx(3):idx(3)+6)
T(25:30) = R(idx(4):idx(4)+5)
T(31:35) = R(idx(5):idx(5)+4)
T(36:39) = R(idx(6):idx(6)+3)
T(40:42) = R(idx(7):idx(7)+2)
T(43:44) = R(idx(8):idx(8)+1)
T(45) = R(idx(9))
T(46:53) = R(idx(10):idx(10)+7)
T(54:60) = R(idx(11):idx(11)+6)
T(61:66) = R(idx(12):idx(12)+5)
T(67:71) = R(idx(13):idx(13)+4)
T(72:75) = R(idx(14):idx(14)+3)
T(76:78) = R(idx(15):idx(15)+2)
T(79:80) = R(idx(16):idx(16)+1)
T(81) = R(idx(17))
T(82:88) = R(idx(18):idx(18)+6)
T(89:94) = R(idx(19):idx(19)+5)
T(95:99) = R(idx(20):idx(20)+4)
T(100:103) = R(idx(21):idx(21)+3)
T(104:106) = R(idx(22):idx(22)+2)
T(107:108) = R(idx(23):idx(23)+1)
T(109) = R(idx(24))
T(110:115) = R(idx(25):idx(25)+5)
T(116:120) = R(idx(26):idx(26)+4)
T(121:124) = R(idx(27):idx(27)+3)
T(125:127) = R(idx(28):idx(28)+2)
T(128:129) = R(idx(29):idx(29)+1)
T(130) = R(idx(30))
T(131:135) = R(idx(31):idx(31)+4)
T(136:139) = R(idx(32):idx(32)+3)
T(140:142) = R(idx(33):idx(33)+2)
T(143:144) = R(idx(34):idx(34)+1)
T(145) = R(idx(35))
T(146:149) = R(idx(36):idx(36)+3)
T(150:152) = R(idx(37):idx(37)+2)
T(153:154) = R(idx(38):idx(38)+1)
T(155) = R(idx(39))
T(156:158) = R(idx(40):idx(40)+2)
T(159:160) = R(idx(41):idx(41)+1)
T(161) = R(idx(42))
T(162:163) = R(idx(43):idx(43)+1)
T(164) = R(idx(44))
T(165) = R(idx(45))
end subroutine auto2e_RCopy_8_8

subroutine auto2e_RCopy_KetTransform_8_8(S, T, Ex, Ey, Ez, R, lx, ly, lz)
!
! Transform the ket shell pair from Hermite to Cartesian Gaussian basis.
! This variant of the transformation algorithm starts by copying the Rtuv
! matrix elements into contiguous memory locations.
!
real(F64), dimension(:), intent(out) :: S
real(F64), dimension(:), intent(out) :: T
real(F64), dimension(:), intent(in) :: Ex, Ey, Ez
real(F64), dimension(:), intent(in) :: R
integer, intent(in) :: lx, ly, lz
real(F64) :: c
integer :: tau, nu, phi, i
integer :: x0, y0, z0, x, y, z
S = ZERO
x0 = ((lx + 1) * lx) / 2 + 1
y0 = ((ly + 1) * ly) / 2 + 1
z0 = ((lz + 1) * lz) / 2 + 1
do phi = 0, lz
do nu = 0, ly
do tau = 0, lx
i = ((2*8+3-phi)*phi)/2+nu+1
call auto2e_Rcopy_8_8(T, R(tau+1:), RCopyIdx_8_8(:, i))
x = x0 + tau
y = y0 + nu
z = z0 + phi
c = (-1)**modulo(tau+nu+phi, 2)*Ex(x)*Ey(y)*Ez(z)
S = S + c * T
end do
end do
end do
end subroutine auto2e_RCopy_KetTransform_8_8
end module auto2e_KetTransform_8_8