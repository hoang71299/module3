use test_quan_ly_truong_hoc;

# a. Liệt kê ma_học_sinh, ho_ten_hoc_sinh, gioi_tinh, ma_lop, ten_lop, ma_gvcn của tất cả học sinh trong trường.

select hs.ma_hs, hs.ho_ten_hs, hs.gioi_tinh, l.ma_lop, l.ten_lop, l.ma_gvcn
from hoc_sinh hs
         join lop l on hs.ma_lop = l.ma_lop;
# b. Liệt kê ma_học_sinh, ho_ten_hoc_sinh, hoc_ky, ma_mon_hoc, diem_thi_giua_ky, diem_thi_cuoi_ky
# của tất cả học sinh và các môn học có kết quả tương ứng với từng học sinh trong trường.
select hs.ma_hs, hs.ho_ten_hs, kq.diem_thi_giua_ky, kq.diem_thi_giua_ky
from hoc_sinh hs
         join ket_qua_hoc_tap kq on hs.ma_hs = kq.ma_hs

#  c. Liệt kê ma_giao_vien, ho_ten_giao_vien, ma_lop, ma_mon_hoc,
#  hoc_ky của những giáo viên đã được giao phụ trách ít nhất một môn học.

select ptbm.ma_mh, ptbm.ma_lop, gv.ho_ten_gv, ma_gv
from phu_trach_bo_mon ptbm
         join giao_vien gv on ptbm.ma_gvpt = gv.ma_gv;


# d. Nếu học sinh chưa được phân lớp, họ sẽ không có thông tin liên quan trong kết quả.
# e. Nếu học sinh chưa có kết quả thi của môn nào, họ sẽ không có thông tin liên quan trong kết quả.
# f. Nếu giáo viên chưa phụ trách môn nào, họ sẽ không có thông tin liên quan trong kết quả.
