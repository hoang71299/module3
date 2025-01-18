use test_quan_ly_truong_hoc;
# a. MaHS, HoTenHS, GioiTinh, MaLop, TenLop, NamHoc, MaGVCN, HoTenGV
# (chủ nhiệm) của học sinh trong trường.

select hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, l.ten_lop, l.nam_hoc, gv.ma_gv, gv.ho_ten_gv
from hoc_sinh hs
         join lop l on hs.ma_lop = l.ma_lop
         join giao_vien gv on l.ma_gvcn = gv.ma_gv;

# b. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy của học sinh và các môn học đã có
# kết quả tương ứng với từng học sinh trong trường.

select hs.ma_hs, hs.ho_ten_hs, mh.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky
from hoc_sinh hs
         join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
         join mon_hoc mh on kq.ma_mh = mh.ma_mh

#  c. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách),
#  HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường.

select hs.ma_hs,
       hs.ho_ten_hs,
       mh.ma_mh,
       mh.ten_mh,
       kq.diem_thi_giua_ky,
       kq.diem_thi_cuoi_ky,
       l.ma_lop,
       gv.ma_gv
from hoc_sinh hs
         join lop l on hs.ma_lop = l.ma_lop
         join giao_vien gv on l.ma_gvcn = gv.ma_gv
         join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs
         join mon_hoc mh on kq.ma_mh = mh.ma_mh


# d. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy,
# DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả
# tương ứng với từng học sinh trong trường.

select kq.ma_hs, hs.ho_ten_hs, hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv as ho_ten_gv_chu_nhiem,
       kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       lop.ma_gvcn as ma_gv_phu_trach, gv_phu_trach.ho_ten_gv as ho_ten_gv_phu_trach
from ket_qua_hoc_tap kq
         join hoc_sinh hs on kq.ma_hs = hs.ma_hs
         join lop on hs.ma_lop = lop.ma_lop
         join giao_vien gv_chu_nhiem on lop.ma_gvcn = gv_chu_nhiem.ma_gv
         join mon_hoc mh on kq.ma_mh = mh.ma_mh
         LEFT join giao_vien gv_phu_trach on lop.ma_gvcn = gv_phu_trach.ma_gv;


# e. MaHS, HoTenHS, MaLop, MaGVCN, HoTenGV (chủ nhiệm), HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaGV (phụ trách), HoTenGV (phụ trách)
# của những học sinh nữ với các môn học đã có kết quả thi cuối kỳ hoặc giữa kỳ được 9 điểm trở lên.
select kq.ma_hs,
       hs.ho_ten_hs,
       hs.ma_lop,
       lop.ma_gvcn,
       gv_chu_nhiem.ho_ten_gv as ho_ten_gv_chu_nhiem,
       kq.hoc_ky,
       kq.ma_mh,
       mh.ten_mh,
       kq.diem_thi_giua_ky,
       kq.diem_thi_cuoi_ky,
       lop.ma_gvcn            as ma_gv_phu_trach,
       gv_phu_trach.ho_ten_gv as ho_ten_gv_phu_trach
from ket_qua_hoc_tap kq
         join hoc_sinh hs on kq.ma_hs = hs.ma_hs
         join lop on hs.ma_lop = lop.ma_lop
         join giao_vien gv_chu_nhiem on lop.ma_gvcn = gv_chu_nhiem.ma_gv
         join mon_hoc mh on kq.ma_mh = mh.ma_mh
         LEFT join giao_vien gv_phu_trach on lop.ma_gvcn = gv_phu_trach.ma_gv
where kq.diem_thi_cuoi_ky >= 9
  and hs.gioi_tinh = "Nữ";

# f. MaHS, HoTenHS, HocKy, MaMH, TenMH, DiemThiGiuaKy, DiemThiCuoiKy, MaLop, MaGV (phụ trách),
# HoTenGV (phụ trách) của học sinh và các môn học đã có kết quả tương ứng với từng học sinh trong trường. Với điều kiện là chỉ hiển thị những môn học mà giáo viên phụ trách môn đó cũng chính là giáo viên chủ nhiệm của lớp.
SELECT kq.ma_hs, hs.ho_ten_hs, kq.hoc_ky, kq.ma_mh, mh.ten_mh, kq.diem_thi_giua_ky, kq.diem_thi_cuoi_ky,
       hs.ma_lop, lop.ma_gvcn, gv_chu_nhiem.ho_ten_gv AS ho_ten_gv_chu_nhiem
FROM ket_qua_hoc_tap kq
         JOIN hoc_sinh hs ON kq.ma_hs = hs.ma_hs
         JOIN lop ON hs.ma_lop = lop.ma_lop
         JOIN giao_vien gv_chu_nhiem ON lop.ma_gvcn = gv_chu_nhiem.ma_gv
         JOIN mon_hoc mh ON kq.ma_mh = mh.ma_mh
         LEFT JOIN phu_trach_bo_mon ptbm ON lop.ma_gvcn = ptbm.ma_gvpt AND mh.ma_mh = ptbm.ma_mh AND kq.hoc_ky = ptbm.hoc_ky
WHERE ptbm.ma_gvpt IS NOT NULL;



# g. MaMH, MaLop, HocKy của những môn học đã được thi cuối kỳ vào năm 2023

select   mh.ma_mh, lop.ma_lop, kq.hoc_ky  from ket_qua_hoc_tap kq
join mon_hoc mh on kq.ma_mh = mh.ma_mh
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where year(kq.ngay_gio_thi_cuoi_ky) = 2023;


# h. MaMH, MaLop, HocKy của những môn học đã được thi vào tháng 8 năm 2023

select   mh.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
join mon_hoc mh on kq.ma_mh = mh.ma_mh
join hoc_sinh hs on kq.ma_hs = hs.ma_hs
join lop on hs.ma_lop = lop.ma_lop
where month(kq.ngay_gio_thi_cuoi_ky) = 8 and year(kq.ngay_gio_thi_cuoi_ky) = 2023;

# i. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023
select   mh.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
         join mon_hoc mh on kq.ma_mh = mh.ma_mh
         join hoc_sinh hs on kq.ma_hs = hs.ma_hs
         join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky < '2023-08-20';

# j. MaMH, MaLop, HocKy của những môn học đã được thi trước ngày 20 tháng 8 năm 2023 đúng 1 tuần.

select   mh.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
         join mon_hoc mh on kq.ma_mh = mh.ma_mh
         join hoc_sinh hs on kq.ma_hs = hs.ma_hs
         join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky  >='2023-08-13' and kq.ngay_gio_thi_cuoi_ky > '2023-08-20';


# k. MaMH, MaLop, HocKy của những môn học đã được thi sau ngày 20 tháng 8 năm 2023 đúng 21 ngày.

select   mh.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
         join mon_hoc mh on kq.ma_mh = mh.ma_mh
         join hoc_sinh hs on kq.ma_hs = hs.ma_hs
         join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky>='2023-09-10' and kq.ngay_gio_thi_cuoi_ky <= '2023-10-01';
# l. MaMH, MaLop, HocKy của những môn học đã được thi trong khoảng từ ngày 10 đến ngày 20 tháng 8 năm 2023.

select   mh.ma_mh, lop.ma_lop, kq.hoc_ky
from ket_qua_hoc_tap kq
         join mon_hoc mh on kq.ma_mh = mh.ma_mh
         join hoc_sinh hs on kq.ma_hs = hs.ma_hs
         join lop on hs.ma_lop = lop.ma_lop
where kq.ngay_gio_thi_cuoi_ky >= '2023-09-10' and kq.ngay_gio_thi_cuoi_ky <= '2023-10-01';