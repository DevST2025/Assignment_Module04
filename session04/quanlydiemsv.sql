/*BÀI TẬP LUYỆN TẬP CÂU LỆNH TRUY VẤN 62 CÂU*/
USE QuanLyDiemSV;
-- 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh
-- viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã
-- sinh viên tăng dần
SELECT MASV, HOSV, TENSV, HOCBONG FROM DMSV ORDER BY MASV ;

-- 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
-- Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.
SELECT MASV, HOSV, TENSV, PHAI, NGAYSINH FROM DMSV ORDER BY PHAI ;

-- 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông
-- tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.
SELECT HOSV, TENSV, NGAYSINH, HOCBONG FROM DMSV ORDER BY NGAYSINH ;
SELECT HOSV, TENSV, NGAYSINH, HOCBONG FROM DMSV ORDER BY HOCBONG DESC ;

-- 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
-- môn, Tên môn, Số tiết.
SELECT * FROM DMMH WHERE TENMH LIKE 'T%';

-- 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
-- các thông tin: Họ tên sinh viên, Ngày sinh, Phái.
SELECT HOSV, TENSV, NGAYSINH, PHAI FROM DMSV WHERE TENSV LIKE '%I';

-- 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
-- các thông tin: Mã khoa, Tên khoa.
SELECT * FROM DMKHOA WHERE TENKHOA LIKE '_N%';

-- 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.
SELECT * FROM DMSV WHERE HOSV LIKE '%THI%';

-- 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
-- thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
-- được sắp xếp theo thứ tự Mã khoa giảm dần
SELECT MASV, HOSV, TENSV, MAKHOA, HOCBONG FROM DMSV WHERE HOCBONG > 100000;

-- 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
-- các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.
SELECT HOSV, TENSV, MAKHOA, NOISINH, HOCBONG FROM DMSV WHERE HOCBONG > 150000 AND NOISINH = 'HA NOI';

-- 10.Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông
-- tin: Mã sinh viên, Mã khoa, Phái.
SELECT DMSV.MASV, DMSV.MAKHOA, DMSV.PHAI FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA
WHERE DMKHOA.TENKHOA = 'ANH VAN' OR DMKHOA.TENKHOA = 'VAT LY';

-- 11.Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
-- 05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
-- bổng.
SELECT MASV, NGAYSINH, NOISINH, HOCBONG FROM DMSV WHERE NGAYSINH BETWEEN '1991-01-01' AND '1992-06-05';

-- 12.Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
-- thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.
SELECT MASV, NGAYSINH, PHAI, MAKHOA FROM DMSV WHERE HOCBONG BETWEEN 80000 AND 150000;

-- 13.Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông
-- tin: Mã môn học, Tên môn học, Số tiết.
SELECT * FROM DMMH WHERE SOTIET > 30 AND SOTIET < 45 ;

-- 14.Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các
-- thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.
SELECT DMSV.MASV, DMSV.HOSV, DMSV.TENSV, DMKHOA.TENKHOA, DMSV.PHAI FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA
WHERE DMSV.PHAI = 'NAM' AND (DMKHOA.TENKHOA = 'ANH VAN' OR DMKHOA.TENKHOA = 'TIN HOC');

-- 15.Liệt kê những sinh viên nữ, tên có chứa chữ N
SELECT * FROM DMSV WHERE PHAI = 'NU' AND TENSV LIKE '%N%';

-- 16.Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các
-- thông tin: Họ sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.
SELECT * FROM DMSV WHERE NOISINH = 'HA NOI' AND MONTH(NGAYSINH) = '02';

-- 17.Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh
-- viên, Tuổi,Học bổng.
SELECT HOSV, TENSV, (YEAR(NOW()) - YEAR(NGAYSINH)) AS TUOI, HOCBONG FROM DMSV WHERE (YEAR(NOW()) - YEAR(NGAYSINH) > 20) ;

-- 18.Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh
-- viên, Tuổi, Tên khoa.
SELECT DMSV.HOSV, DMSV.TENSV, (YEAR(NOW()) - YEAR(DMSV.NGAYSINH)) AS TUOI, DMKHOA.TENKHOA FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA
WHERE (YEAR(NOW()) - YEAR(NGAYSINH)) BETWEEN 20 AND 25 ;

-- 19.Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ
-- tên sinh viên,Phái, Ngày sinh.
SELECT HOSV, TENSV, PHAI, NGAYSINH FROM DMSV 
WHERE YEAR(NGAYSINH) = 1990 AND (MONTH(NGAYSINH) BETWEEN 01 AND 03);

-- 20.Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên,
-- Phái, Mã khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học
-- bổng cao” nếu giá trị của field học bổng lớn hơn 500,000 và ngược lại hiển
-- thị là “Mức trung bình”
SELECT MASV, PHAI, MAKHOA, 
CASE
WHEN HOCBONG > 500000 THEN 'HOC BONG CAO'
ELSE 'HOC BONG TRUNG BINH'
END AS MUCHOCBONG
FROM DMSV ;

-- 21.Cho biết tổng số sinh viên của toàn trường
SELECT COUNT(*) AS TONGSOSV FROM DMSV ;

-- 22.Cho biết tổng sinh viên và tổng sinh viên nữ.
SELECT 'NAM' AS '', COUNT(*) AS SOLUONG FROM DMSV WHERE PHAI = 'NAM'
UNION
SELECT 'NU', COUNT(*) FROM DMSV WHERE PHAI = 'NU'
UNION
SELECT 'TONGCONG', COUNT(*) FROM DMSV
;

-- 23.Cho biết tổng số sinh viên của từng khoa.
SELECT DMKHOA.TENKHOA, COUNT(*) AS SOLUONG FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA GROUP BY DMKHOA.TENKHOA; 

-- 24.Cho biết số lượng sinh viên học từng môn.
SELECT DMMH.TENMH, COUNT(DISTINCT DMSV.MASV) AS SOSV FROM DMSV 
JOIN KETQUA ON DMSV.MASV = KETQUA.MASV
JOIN DMMH ON KETQUA.MAMH = DMMH.MAMH
GROUP BY DMMH.TENMH
;

-- 25.Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có
-- trong bảng kq)
SELECT DMSV.MASV, COUNT(DISTINCT DMMH.TENMH) AS SOMONHOC FROM DMSV 
JOIN KETQUA ON DMSV.MASV = KETQUA.MASV
JOIN DMMH ON KETQUA.MAMH = DMMH.MAMH
GROUP BY DMSV.MASV
;

-- 26.Cho biết tổng số học bổng của mỗi khoa.
SELECT DMKHOA.TENKHOA, SUM(DMSV.HOCBONG) AS TONGHOCBONG FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA GROUP BY DMKHOA.TENKHOA;

-- 27.Cho biết học bổng cao nhất của mỗi khoa.
SELECT DMKHOA.TENKHOA, MAX(DMSV.HOCBONG) AS TONGHOCBONG FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA GROUP BY DMKHOA.TENKHOA;

-- 28.Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa.
SELECT 'NAM' AS '', COUNT(*) AS SOLUONG FROM DMSV WHERE PHAI = 'NAM'
UNION
SELECT 'NU', COUNT(*) FROM DMSV WHERE PHAI = 'NU'
UNION
SELECT 'TONGCONG', COUNT(*) FROM DMSV
;

-- 29.Cho biết số lượng sinh viên theo từng độ tuổi.
SELECT YEAR(NOW()) - YEAR(NGAYSINH) AS TUOI, COUNT(*) AS SOLUONG FROM DMSV GROUP BY YEAR(NOW()) - YEAR(NGAYSINH);

-- 30.Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường.
SELECT YEAR(NGAYSINH) AS NAM FROM DMSV GROUP BY YEAR(NGAYSINH) HAVING COUNT(*) = 2  ;

-- 31.Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường.
SELECT NOISINH FROM DMSV GROUP BY NOISINH HAVING COUNT(*) > 2  ;

-- 32.Cho biết những môn nào có trên 3 sinh viên dự thi.
SELECT DMMH.TENMH FROM KETQUA 
JOIN DMMH ON KETQUA.MAMH = DMMH.MAMH
GROUP BY DMMH.TENMH HAVING COUNT(distinct KETQUA.MASV) > 3;

-- 33.Cho biết những sinh viên thi lại trên 2 lần.
SELECT distinct DMSV.HOSV, DMSV.TENSV, COUNT(KETQUA.DIEM) AS SOLANTHI FROM KETQUA
JOIN DMSV ON DMSV.MASV = KETQUA.MASV
GROUP BY KETQUA.MAMH, KETQUA.MASV
HAVING COUNT(KETQUA.DIEM) > 1
;

-- 34.Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0
SELECT DMSV.HOSV, DMSV.TENSV FROM DMSV 
JOIN KETQUA ON KETQUA.MASV = DMSV.MASV
WHERE DMSV.PHAI = 'NAM' AND KETQUA.LANTHI = 1 
GROUP BY KETQUA.MASV 
HAVING AVG(KETQUA.DIEM) > 7
;

-- 35.Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.
SELECT DMSV.HOSV, DMSV.TENSV FROM KETQUA
JOIN DMSV ON KETQUA.MASV = DMSV.MASV
WHERE KETQUA.LANTHI = 1 AND KETQUA.DIEM < 5
GROUP BY KETQUA.MASV 
HAVING COUNT(*) >= 2
;

-- 36.Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam
SELECT DMKHOA.TENKHOA FROM DMSV
JOIN DMKHOA ON DMKHOA.MAKHOA = DMSV.MAKHOA
WHERE DMSV.PHAI = 'NAM'
GROUP BY DMSV.MAKHOA
HAVING COUNT(*) > 2
;

-- 37.Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000.
SELECT DMKHOA.TENKHOA FROM DMSV
JOIN DMKHOA ON DMKHOA.MAKHOA = DMSV.MAKHOA
WHERE DMSV.PHAI = 'NAM'
GROUP BY DMSV.MAKHOA
HAVING COUNT(*) > 2
;

-- 38.Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn
-- trong lần thi 1.
SELECT DMMH.TENMH, COUNT(*) AS SOLUONGDAU FROM KETQUA 
JOIN DMMH ON DMMH.MAMH = KETQUA.MAMH
WHERE KETQUA.LANTHI = 1 AND KETQUA.DIEM >= 5
GROUP BY DMMH.MAMH 
;

SELECT DMMH.TENMH, COUNT(*) AS SOLUONGROT FROM KETQUA 
JOIN DMMH ON DMMH.MAMH = KETQUA.MAMH
WHERE KETQUA.LANTHI = 1 AND KETQUA.DIEM < 5
GROUP BY DMMH.MAMH 
;

-- 39.Cho biết sinh viên nào có học bổng cao nhất.
SELECT * FROM DMSV WHERE
HOCBONG = (SELECT HOCBONG FROM DMSV ORDER BY HOCBONG DESC LIMIT 1)
;

-- 40.Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất.
SELECT MASV FROM KETQUA 
WHERE DIEM = (
SELECT KETQUA.DIEM FROM KETQUA 
JOIN DMMH ON DMMH.MAMH = KETQUA.MAMH
WHERE KETQUA.LANTHI = 1 AND  DMMH.TENMH = 'CO SO DU LIEU'
ORDER BY DIEM DESC LIMIT 1
) AND LANTHI = 1
;

-- 41.Cho biết sinh viên khoa anh văn có tuổi lớn nhất.
SELECT HOSV, TENSV FROM DMSV
WHERE (YEAR(NOW()) - YEAR(NGAYSINH)) = (SELECT (YEAR(NOW()) - YEAR(NGAYSINH)) FROM DMSV WHERE MAKHOA = 'AV' ORDER BY (YEAR(NOW()) - YEAR(NGAYSINH)) DESC LIMIT 1)
AND MAKHOA = 'AV';

-- 42.Cho biết khoa nào có đông sinh viên nhất.
SELECT DMKHOA.TENKHOA FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA 
GROUP BY DMKHOA.TENKHOA HAVING COUNT(*) = (SELECT COUNT(*) FROM DMSV JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA GROUP BY DMKHOA.TENKHOA ORDER BY COUNT(*) DESC LIMIT 1)
 ; 

-- 43.Cho biết khoa nào có đông nữ nhất.
SELECT DMKHOA.TENKHOA FROM DMSV 
JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA
WHERE DMSV.PHAI = 'NU'
GROUP BY DMKHOA.MAKHOA
HAVING COUNT(*) = (
SELECT COUNT(*) FROM DMSV 
JOIN DMKHOA ON DMSV.MAKHOA = DMKHOA.MAKHOA
WHERE DMSV.PHAI = 'NU'
GROUP BY DMKHOA.MAKHOA
ORDER BY COUNT(*) DESC LIMIT 1
)
;

-- 44.Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất.
SELECT DMMH.TENMH FROM KETQUA JOIN DMMH ON DMMH.MAMH = KETQUA.MAMH WHERE KETQUA.LANTHI = 1 GROUP BY KETQUA.MAMH 
HAVING COUNT(*) = (SELECT COUNT(*) FROM KETQUA WHERE LANTHI = 1 GROUP BY MAMH ORDER BY COUNT(*) DESC LIMIT 1);

-- 45.Cho biết sinh viên không học khoa anh văn có điểm thi môn văn phạm lớn hơn
-- điểm thi văn phạm của sinh viên học khoa anh văn.
SELECT DMSV.MASV FROM DMSV JOIN KETQUA ON KETQUA.MASV = DMSV.MASV 
WHERE DMSV.MASV NOT IN (SELECT DMSV.MASV FROM DMSV WHERE DMSV.MAKHOA = 'AV') AND KETQUA.MAMH = '05'
AND KETQUA.DIEM > ANY(SELECT KETQUA.DIEM FROM DMSV JOIN KETQUA ON KETQUA.MASV = DMSV.MASV WHERE DMSV.MAKHOA = 'AV' AND KETQUA.MAMH = '05');

-- 46.Cho biết sinh viên có nơi sinh cùng với Hải.

SELECT MASV FROM DMSV WHERE NOISINH = (SELECT NOISINH FROM DMSV WHERE TENSV = 'HAI') AND TENSV NOT LIKE 'HAI';

-- 47.Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của
-- sinh viên thuộc khoa anh văn
SELECT MASV FROM DMSV WHERE MAKHOA = 'AV';
SELECT MASV FROM DMSV WHERE MASV NOT IN (SELECT MASV FROM DMSV WHERE MAKHOA = 'AV') AND HOCBONG > ALL(SELECT HOCBONG FROM DMSV WHERE MAKHOA = 'AV');

-- 48.Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên
-- học khóa anh văn
SELECT MASV FROM DMSV WHERE MAKHOA = 'AV';
SELECT MASV FROM DMSV WHERE MASV NOT IN (SELECT MASV FROM DMSV WHERE MAKHOA = 'AV') AND HOCBONG > ANY(SELECT HOCBONG FROM DMSV WHERE MAKHOA = 'AV');

-- 49. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm
-- thi lần 1 môn cơ sở dữ liệu của những sinh viên khác.
SELECT MASV FROM KETQUA WHERE LANTHI = '2' AND MAMH = '01' AND DIEM > ALL(SELECT DIEM FROM KETQUA WHERE MAMH = '01' AND LANTHI = '1') ;

-- 50.Cho biết những sinh viên đạt điểm cao nhất trong từng môn.
SELECT MAMH, MASV FROM KETQUA GROUP BY MAMH, MASV HAVING MAX(DIEM) ; -- ?

-- 51.Cho biết những khoa không có sinh viên học.
SELECT TENKHOA FROM DMKHOA WHERE MAKHOA NOT IN (SELECT (MAKHOA) FROM DMSV GROUP BY MAKHOA);

-- 52.Cho biết sinh viên chưa thi môn cơ sở dữ liệu.
SELECT MASV FROM DMSV WHERE MASV NOT IN (SELECT MASV FROM KETQUA WHERE MAMH = '01' GROUP BY MASV);

-- 53.Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2.
SELECT MASV FROM KETQUA WHERE LANTHI = '2' AND MASV NOT IN (SELECT MASV FROM KETQUA WHERE LANTHI = '1');

-- 54.Cho biết môn nào không có sinh viên khoa anh văn học. <---
SELECT MASV FROM DMSV WHERE MAKHOA = 'AV' ;

-- 55.Cho biết những sinh viên khoa anh văn chưa học môn văn phạm.
SELECT sv.MaSV, sv.TenSV
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE 
	k.TenKhoa LIKE ('Anh Văn') AND
    sv.MaSV NOT IN (SELECT kq.MaSV
					FROM ketqua kq
					INNER JOIN dmmh mh ON mh.MaMH = kq.MaMH
					WHERE mh.TenMH LIKE ('Văn Phạm'));

-- 56.Cho biết những sinh viên không rớt môn nào.
SELECT sv.MaSV, concat(sv.HoSV, '', sv.TenSV) HoTen, kq.MaMH, kq.Diem, kq.LanThi
FROM dmsv sv
LEFT JOIN ketqua kq ON kq.MaSV = sv.MaSV
WHERE kq.Diem > 5;

-- 57.Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên
-- chưa bao giờ rớt.
SELECT *
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE k.TenKhoa LIKE('Anh Văn') AND sv.HocBong > 0;

-- 58.Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa
-- nào có ít sinh viên nhận học bổng nhất.
SELECT 
	k.TenKhoa,
    count(sv.HocBong) so_lg
FROM dmsv sv
INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
WHERE sv.HocBong > 0
GROUP BY k.TenKhoa
HAVING count(sv.HocBong) 
IN 	  (SELECT max(A.so_lg) AS `Max`
	   FROM (SELECT k.TenKhoa, count(sv.HocBong) so_lg
			 FROM dmsv sv
			 INNER JOIN dmkhoa k ON k.MaKhoa = sv.MaKhoa
			 WHERE sv.HocBong > 0
			 GROUP BY k.TenKhoa) AS A);

-- 59.Cho biết 3 sinh viên có học nhiều môn nhất.
SELECT DISTINCT 
	kq.MaSV, 
    count(kq.MaSV) solg
FROM ketqua kq
GROUP BY kq.MaSV
ORDER BY  count(kq.MaSV) DESC
LIMIT 3;

-- 60.Cho biết những môn được tất cả các sinh viên theo học.
SELECT DISTINCT
	MaMH,
    count(MaMH) slg
FROM ketqua kq
GROUP BY MaMH
ORDER BY MaMH
LIMIT 1;

-- 61.Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học.
SELECT DISTINCT A.MaSV
FROM 
	(SELECT DISTINCT MaSV, MaMH
	FROM quanlydiemsv.ketqua
	WHERE MaSV NOT LIKE ('A02')
	ORDER BY MaSV) AS A
INNER JOIN 
	(SELECT DISTINCT MaMH
	FROM ketqua kq
	WHERE MaSV = 'A02') AS B ON B.MaMH = A.MaMH;

-- 62.Cho biết những sinh viên học những môn bằng đúng những môn mà sinh
-- viên A02 học.
SELECT  A.MaSV
FROM 
	(SELECT DISTINCT MaSV, MaMH
	FROM quanlydiemsv.ketqua
	WHERE MaSV NOT LIKE ('A02')
	ORDER BY MaSV) AS A
WHERE A.MaMH = ALL
	(SELECT DISTINCT MaMH
	FROM ketqua kq
	WHERE MaSV = 'A02');
