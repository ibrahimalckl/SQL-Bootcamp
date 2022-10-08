--1)Tüm tablolardaki verileri ayrı ayrı görüntüleyiniz
select *
from adres

select *
from fatura

select *
from faturaDetay

select *
from ilce

select *
from kullanici

select *
from sehir

select *
from sepet

select *
from siparis

select *
from siparisDetay

select *
from sipDurum

select *
from urun

select *
from urunAltKateg

select *
from urunKateg

--2)kullanici tablosunda bulunan kullanıcıların adsoyad, cinsiyet ve doğum tarihlerini görüntüleyiniz
select adSoyad, cinsiyet, dogumTarihi 
from kullanici

--3)urun tablosunda fiyatı 200 ve üzerinde olan ürünlerin bilgilerini görüntüleyiniz
select * 
from urun 
where fiyat>=200

--4)kullanici tablosunda ilk adı ahmet olan kullanıcıların bilgilerini listeleyiniz.
--Örnek  Ahmet Efe Sivacı, Ahmet İncikapı.
select * 
from kullanici 
where adSoyad like 'Ahmet%'

--5)urun tablosunda urunAdi alanında içerisinde pirinç kelimesi geçen ürünleri listeleyiniz
select * 
from urun 
where urunAdi like '%pirinç%'

--6)urun tablosunda alt kategori numarası 13 olan ürünlerden 30 TL ve üzerinde olanların bilgilerini görüntüleyiniz
select * 
from urun 
where (altkategorino = 13 and fiyat >= 30)

--7)urun tablosunda alt kategori numarası 24 ve 25 olanları birlikte görüntüleyiniz
select * 
from urun 
where altkategorino in (24,25)

--8)hangi ürünler sipariş edilmiştir ürün numaralarını gösteriniz (her ürün numarası bir kez gösterilmelidir)


--9)kullanıcılar arasında doğum tarihi 1999 olan erkekleri gösteriniz
select *
from kullanici
where (dogumTarihi like '1999%' and cinsiyet = 'E')

--10)sipariş tablosundaki kayıtları toplam tutara göre azalan sıralamada sıralayınız
select *
from siparis
order by toplamTutar desc

--11)ürünleri pahalıdan ucuza sıralayarak gösteriniz
select *
from urun
order by fiyat desc

--12)urun tablosundaki urunAdi ve fiyat alanlarını Ürün Adı ve Ürün Fiyatı olarak görünecek şekilde görüntüleyiniz
select urunNo, urunKod, urunAdi as [Ürün Adı], fiyat as [Ürün Fiyatı], altkategorino
from urun

--13)ortalama sipariş tutarı nedir. sadece bu rakamı ondalıklı olarak görüntüleyiniz
select AVG(toplamTutar) as [Ortalama Siparis Tutari]
from siparis

--14)urun tablosundaki tum alanlarla birlikte fiyat değerine %18 kdv ekleyerek kdvdahil isimli alanda gösteriniz.
select urunNo, urunKod, urunAdi, fiyat, ((fiyat * 18/100) + fiyat) as kdvdahil, altkategorino
from urun

--15)kullanıcıların eposta alanlarında bulunan kullanıcı adlarını (@ işaretinin solundaki kısım) kAdi isimli alanda gösteriniz.
--@ işaretinin yerini bulmak için charindex() fonksiyonunu kullanabilirsiniz, gerekirse araştırınız
select eposta, 
substring(eposta,0,charindex('@',eposta)) as "kAdi"
from kullanici

--16)eposta adresindeki kullanıcı adı kısmı(@ işaretinin solundaki kısım) ile tablodaki kullanıcıAdi alanını karşılaştırarak farklı olan kayıtları gösteriniz
select kullaniciAdi, eposta,
substring(eposta, 0, charindex('@',eposta)) as "kAdi"
from kullanici

--17)kullanici tablosunda tel1 veya tel2 alanındaki telefonlardan 505 kodunu kullanan kullanıcıları listeletiniz
select *
from kullanici
where tel1 like '(505%'

--18)1 nisanda doğmuş kullanıcıları listeleyiniz
select *
from kullanici
where dogumTarihi like '_____04-01'

--19)kullanıcıların bilgileri ile birlikte Yaş alanında yaşlarını görüntüleyiniz
select *, (DATEPART(YEAR,dogumTarihi) - 2021) * -1 as "Yaş" 
from kullanici

--20)yaşı 36 olan kullanıcıların bilgilerini gösteriniz
select *, (DATEPART(YEAR,dogumTarihi) - 2021) * -1 as "Yaş" 
from kullanici
where (DATEPART(YEAR,dogumTarihi) - 2021) * -1 = 36

--21)urun tablosunda alt kategori numarası 48 olan ürünleri ucuzdan pahalıya sıralayınız
select *
from urun
where altkategorino = 48 
order by fiyat

--22)urun tablosunda ürün adı 7 karakterden oluşan ürünleri listeleyiniz
select *
from urun
where len(urunAdi) = 7 

--23)kullanıcı tablosunda adsoyad uzunluğunu göstererek bilgileri bu uzunluğa göre azalan sıralamada sıralayınız.
select *, len(adSoyad) as "adSoyad Uzunluğu"
from kullanici
order by len(adSoyad) desc

--24)urun tablosunda 10 nolu alt kategoriye ait urunlerin ortalama fiyatını virgulden sonra 2 basamak olacak şekilde gösteriniz
select cast(avg(fiyat) as  decimal(10,2)) as Ortalama
from urun
where altkategorino = 10

--25)en yüksek sipariş tutarını gösteriniz (tek bir sayı gösterilecek)
select max(toplamTutar) as "En Yüksek Sipariş Ücreti"
from siparis