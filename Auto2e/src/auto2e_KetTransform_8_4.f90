module auto2e_KetTransform_8_4
use arithmetic
implicit none

integer, dimension(45, 15), parameter :: RCopyIdx_8_4 = reshape([1, 14, 26, 37, 47, &
    56, 64, 71, 77, 92, 104, 115, 125, 134, 142, 149, 155, 170, 181, 191, 200, 208, &
    215, 221, 236, 246, 255, 263, 270, 276, 291, 300, 308, 315, 321, 336, 344, 351, &
    357, 372, 379, 385, 400, 406, 421, 14, 26, 37, 47, 56, 64, 71, 77, 82, 104, 115, &
    125, 134, 142, 149, 155, 160, 181, 191, 200, 208, 215, 221, 226, 246, 255, 263, &
    270, 276, 281, 300, 308, 315, 321, 326, 344, 351, 357, 362, 379, 385, 390, 406, &
    411, 426, 26, 37, 47, 56, 64, 71, 77, 82, 86, 115, 125, 134, 142, 149, 155, 160, &
    164, 191, 200, 208, 215, 221, 226, 230, 255, 263, 270, 276, 281, 285, 308, 315, &
    321, 326, 330, 351, 357, 362, 366, 385, 390, 394, 411, 415, 430, 37, 47, 56, &
    64, 71, 77, 82, 86, 89, 125, 134, 142, 149, 155, 160, 164, 167, 200, 208, 215, &
    221, 226, 230, 233, 263, 270, 276, 281, 285, 288, 315, 321, 326, 330, 333, 357, &
    362, 366, 369, 390, 394, 397, 415, 418, 433, 47, 56, 64, 71, 77, 82, 86, 89, &
    91, 134, 142, 149, 155, 160, 164, 167, 169, 208, 215, 221, 226, 230, 233, 235, &
    270, 276, 281, 285, 288, 290, 321, 326, 330, 333, 335, 362, 366, 369, 371, 394, &
    397, 399, 418, 420, 435, 92, 104, 115, 125, 134, 142, 149, 155, 160, 170, 181, &
    191, 200, 208, 215, 221, 226, 236, 246, 255, 263, 270, 276, 281, 291, 300, 308, &
    315, 321, 326, 336, 344, 351, 357, 362, 372, 379, 385, 390, 400, 406, 411, 421, &
    426, 436, 104, 115, 125, 134, 142, 149, 155, 160, 164, 181, 191, 200, 208, 215, &
    221, 226, 230, 246, 255, 263, 270, 276, 281, 285, 300, 308, 315, 321, 326, 330, &
    344, 351, 357, 362, 366, 379, 385, 390, 394, 406, 411, 415, 426, 430, 440, 115, &
    125, 134, 142, 149, 155, 160, 164, 167, 191, 200, 208, 215, 221, 226, 230, 233, &
    255, 263, 270, 276, 281, 285, 288, 308, 315, 321, 326, 330, 333, 351, 357, 362, &
    366, 369, 385, 390, 394, 397, 411, 415, 418, 430, 433, 443, 125, 134, 142, 149, &
    155, 160, 164, 167, 169, 200, 208, 215, 221, 226, 230, 233, 235, 263, 270, 276, &
    281, 285, 288, 290, 315, 321, 326, 330, 333, 335, 357, 362, 366, 369, 371, 390, &
    394, 397, 399, 415, 418, 420, 433, 435, 445, 170, 181, 191, 200, 208, 215, 221, &
    226, 230, 236, 246, 255, 263, 270, 276, 281, 285, 291, 300, 308, 315, 321, 326, &
    330, 336, 344, 351, 357, 362, 366, 372, 379, 385, 390, 394, 400, 406, 411, 415, &
    421, 426, 430, 436, 440, 446, 181, 191, 200, 208, 215, 221, 226, 230, 233, 246, &
    255, 263, 270, 276, 281, 285, 288, 300, 308, 315, 321, 326, 330, 333, 344, 351, &
    357, 362, 366, 369, 379, 385, 390, 394, 397, 406, 411, 415, 418, 426, 430, 433, &
    440, 443, 449, 191, 200, 208, 215, 221, 226, 230, 233, 235, 255, 263, 270, 276, &
    281, 285, 288, 290, 308, 315, 321, 326, 330, 333, 335, 351, 357, 362, 366, 369, &
    371, 385, 390, 394, 397, 399, 411, 415, 418, 420, 430, 433, 435, 443, 445, 451, &
    236, 246, 255, 263, 270, 276, 281, 285, 288, 291, 300, 308, 315, 321, 326, 330, &
    333, 336, 344, 351, 357, 362, 366, 369, 372, 379, 385, 390, 394, 397, 400, 406, &
    411, 415, 418, 421, 426, 430, 433, 436, 440, 443, 446, 449, 452, 246, 255, 263, &
    270, 276, 281, 285, 288, 290, 300, 308, 315, 321, 326, 330, 333, 335, 344, 351, &
    357, 362, 366, 369, 371, 379, 385, 390, 394, 397, 399, 406, 411, 415, 418, 420, &
    426, 430, 433, 435, 440, 443, 445, 449, 451, 454, 291, 300, 308, 315, 321, 326, &
    330, 333, 335, 336, 344, 351, 357, 362, 366, 369, 371, 372, 379, 385, 390, 394, &
    397, 399, 400, 406, 411, 415, 418, 420, 421, 426, 430, 433, 435, 436, 440, 443, &
    445, 446, 449, 451, 452, 454, 455], [45, 15])

contains

subroutine auto2e_RCopy_8_4(T, R, idx)
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
end subroutine auto2e_RCopy_8_4

subroutine auto2e_RCopy_KetTransform_8_4(S, T, Ex, Ey, Ez, R, lx, ly, lz)
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
i = ((2*4+3-phi)*phi)/2+nu+1
call auto2e_Rcopy_8_4(T, R(tau+1:), RCopyIdx_8_4(:, i))
x = x0 + tau
y = y0 + nu
z = z0 + phi
c = (-1)**modulo(tau+nu+phi, 2)*Ex(x)*Ey(y)*Ez(z)
S = S + c * T
end do
end do
end do
end subroutine auto2e_RCopy_KetTransform_8_4
end module auto2e_KetTransform_8_4