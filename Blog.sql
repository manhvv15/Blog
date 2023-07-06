
CREATE DATABASE Blog
GO
USE Blog
GO
CREATE TABLE account(
	username varchar(100) primary key,
	password varchar(100) not null
)

GO
GO
CREATE TABLE post(
	id int primary key IDENTITY(1,1),
	title ntext not null,
	info ntext not null,
	[image] varchar(100) not null,
	vote int not null,
	category varchar(100) not null
)
CREATE TABLE feedback (
	id int IDENTITY(1,1) primary key,
	[name] varchar(100) FOREIGN KEY REFERENCES account(username),
	content ntext not null,
	[date] date not null,
	postId int FOREIGN KEY REFERENCES post(id)
)
GO

GO
INSERT INTO account(username, password) VALUES ('manh', '123'),
('user1', '123'),
('user2', '123'),
('user3', '123'),
('user4', '123'),
('user5', '123'),
('user6', '123'),
('user7', '123'),
('user8', '123');
INSERT INTO account(username, password) VALUES('user9', '123')
GO
INSERT INTO post(title, info, image, vote, category) VALUES (N'Cappuccino là loại café đã quá quen thuộc với người dân toàn thế giới. Vậy bạn có biết Cappuccino xuất xứ từ đâu, được pha chế như thế nào và vì sao có thể chinh phục cả thế giới?', N'CapCappuccino là tên gọi một loại café của Ý, được tạo nên từ 3 phần đều nhau: Café Espresso pha với lượng nước gấp đôi thông thường (espresso lungo), sữa nóng và sữa sủi bọt. Để hoàn thiện khẩu vị, người ta thường rải lên trên tách cà phê Cappuccino là bột ca cao hay bột quế. Trong các quán cà phê ở Ý, Barista thường dùng khuôn hay dùng thìa và bằng cách khuấy điệu nghệ trong lúc rắc bột để tạo thành các hình nghệ thuật. Tên gọi của loại café này được cho là xuất phát từ tên gọi các nhà tu dòng Capuchin, màu áo thụng của các nhà tu gần giống với màu nâu của một tách cà phê Cappuccino hoàn hảo. Mũ của chiếc áo tu này được gọi trong tiếng Ý là cappuccio.<br><br>

Cappuccino mà chúng ta thưởng thức ngày nay được giới thiệu lần đầu tiên vào thế kỷ 20. Máy pha café Cappuccino được phát minh bởi Luigi Bezzera năm 1901. Phát minh này đã giúp việc pha Cappuccino trở nên đơn giản hơn. Những tài liệu đầu tiên có ghi chép về Cappuccino được tìm thấy vào khoảng năm 1948. Cho đến những năm 1950, Cappuccino đã trở thành một trong những loại thức uống phổ biến trên toàn thế giới. Tách Cappuccino bao gồm 3 thành phần chính: Café espresso, sữa nóng và sữa sủi bọt, tạo nên sự hòa quyện hoàn hảo về hương vị với vị café trầm và nhẹ, hơi đăng đắng và vị béo của sữa, ngọt ngào của kem.<br><br>

Thành phần của Cappuccin tương tự như Latte – một loại café khác của Ý nên thường khiến nhiều người nhầm lẫn hai loại café này. Về cơ bản, thành phần của Cappuccino và Latte giống nhau nhưng lượng sữa và bọt sữa trong tách Cappucino khá tương đồng. Còn với latte, lượng bọt sữa chỉ xấp xỉ một nửa lượng sữa, nên Cappuccino có độ bồng bềnh hơn so với Latte. Yếu tố quan trọng làm nên sức hấp dẫn của Cappuccino đó là lớp bọt sữa (foam), có độ dày chừng 2 – 3 cm. Về hương vị, lớp bọt sữa tăng độ béo, hương thơm cho kem sữa và giảm độ chua, đắng của café, giúp tách café trở nên tròn vị hơn. Bên cạnh đó, lớp bọt sữa này còn có tác dụng giữ nhiệt, giữ phần café và sữa phía dưới nóng và thơm lâu hơn. Còn về mặt thẩm mỹ, lớp bọt sữa được tạo hình đa dạng từ hình trái tim, dương xỉ… sẽ khiến tách café đẹp mắt hơn, hấp dẫn hơn. Lớp bọt sữa cũng phần nào thể hiện được trình độ và đẳng cấp của một Barista. Với nhiều người, tạo hình cho bọt sữa hay còn gọi là nghệ thuật trang trí trên ly café (Latte Art) chính là một thử thách khó khăn và đầy thú vị. Tạo hình càng sáng tạo, đẹp mắt thì chứng tỏ Barista càng lành nghề.', 'Image/cappucino.jpd', 4, 'drink');

GO
INSERT INTO post(title, info, image, vote, category) VALUES (N'Bạc xỉu là gì? Nguồn gốc và cách làm bạc xỉu thơm ngon đơn giản tại nhà', N'Bạc xỉu là một loại đồ uống được làm từ cà phê có pha sữa nhưng phần sữa sẽ nhiều hơn so với phần cà phê. Từ “bạc xỉu” xuất phát từ tiếng Quảng Đông và được người Hoa dùng phổ biến trong khu vực buôn bán ở Sài Gòn - Chợ lớn lúc bấy giờ.<br><br>

Nếu gọi đầy đủ, nó có tên là bạc tẩy xíu phé, trong đó “bạc” có nghĩa là màu trắng, “tẩy” nghĩa là cái ly không, “xỉu” có nghĩa là một chút và “phé” có nghĩa là cà phê. Nôm na là một loại đồ uống từ sữa nóng có pha thêm một chút cà phê. Bạc xỉu có thể được xem là loại đồ uống được pha trộn giữa ba nền văn hóa là Hoa - Pháp - Việt. Vào thời kỳ Pháp thuộc ở Việt Nam (1858 - 1954), người Hoa sống tại Sài Gòn dường như đi sớm trong việc kinh doanh hàng quán, kể cả việc mở bán cà phê.<br><br>

Trong thời gian đầu, phụ nữ và trẻ con không quan tâm đến việc dùng cà phê đen và cà phê sữa vì chúng có vị đắng, rất khó uống. Thậm chí có thời điểm sữa tươi lại có giá khá đắt đỏ nên người ta đã dùng sữa đặc pha với nước nóng để thay thế.<br><br>

Dần dần, vị đắng gắt của cà phê dường như không còn nữa và thế là bạc xỉu ra đời (vì sử dụng nhiều sữa hơn cà phê, giúp giảm bớt độ đắng và tạo hương thơm đặc trưng cho món nước). Hơn nữa, bạc xỉu còn được thưởng thức kèm với giò cháo quẩy và bánh tiêu mỗi lần dùng vào buổi sáng.<br><br>', 'Image/bacXiu.jpg', 5, 'category');
GO
INSERT INTO post(title, info, image, vote, category) VALUES (N'Coca-Cola là nhãn hiệu nước ngọt nổi tiếng của thế giới và luôn được nhiều người yêu thích bởi hương vị đặc trưng và độc nhất. Hãy cùng tìm hiểu về Coca Cola ngay sau đây nhé!', N'Coca-Cola (còn được gọi tắt là Coke) là nhãn hiệu nước ngọt được đăng ký năm 1893 tại Mỹ. Cha đẻ của Coca-Cola là dược sĩ John Pemberton và theo cách hiểu của người dân Mỹ thời kỳ đó Coke (Coca Cola) là một loại thuốc uống. Sau này, khi mua lại Coca Cola, Asa Griggs Candler - Nhà lãnh đạo tài ba bậc nhất của Coca Cola đã biến chuyển suy nghĩ của người dân nước Mỹ về hình ảnh của Coca Cola. Ông cho những người tiêu dùng của mình hiểu thứ "thuốc uống" Coke là một loại thức uống ngon lành và tươi mát. Cho đến ngày nay, Coca Cola vẫn trung thành với tiêu chí này của hãng. Hình dạng chai Coca-Cola được đăng ký bảo hộ năm 1960. Một đồ uống có từ hơn trăm năm nay vẫn giữ được ưu thế về thương hiệu so với những biểu tượng của công nghệ hiện đại. Một công thức pha chế thông thường mà vẫn đắt giá. Trong hàng ngàn các sản phẩm thị trường, Coca cola vẫn đứng vững và là biểu tượng cho thời hiện đại và khả năng sáng tạo của con người trên trái đất. Vì sao vậy ? Câu trả lời có lẽ ở chỗ đồ uống này không phải chỉ là một thứ giải khát thuần tuý, mà đã trở thành một phần bản sắc văn hoá Mỹ.<br><br>

Hơn 65 tỉ USD cho nhãn hiệu Coca-Cola đã giúp thương hiệu này đứng đầu top bình chọn 100 nhãn hiệu hàng đầu thế giới. Đó là kết quả trong bảng xết hạng của tạp chí BusinessWeek và hãng Interbrand vừa mới được công bố. Mặc dù đã thay đến 3 đời CEO kể từ năm 2000, nhưng Coke vẫn tiếp tục giữ vững ngôi vị số 1 trên thị trường đồ uống có ga của Mỹ, với 42,8% thị phần (vị trí thứ hai là của Pepsi với thị phần 31,1%). Tổng cộng mỗi ngày có 1,7 tỷ sản phẩm của Coke được tiêu thụ trên thị trường toàn cầu.<br><br>

 Poster quảng cáo đầu tiên của Coca-Cola có tên Bước đột phá mới (Refreshing Endorsement) được ra mắt năm 1900 khi Coke bắt đầu được bày bán tại các hiệu thuốc. Một cốc Coke có giá chỉ 5 cent. Đáng ngạc nhiên là mức giá này được giữ cho đến tận 40 năm. Cha đẻ của Coca-Cola là dược sĩ John Styth Pemberton, chủ một phòng thí nghiệm và hiệu thuốc tư nhân với mục đích ban đầu là chế tạo ra một loại siro có tác dụng giảm nhức đầu, mệt mỏi. Tuy nhiên, chính bản thân ông cũng không ngờ là đã mang lại cho thế giới một thứ đồ uống giải khát tuyệt hảo đến thế. Từ khi được thành lập và đặt trụ sở chính tại Atlanta, bang Georgia, tập đoàn Coca-cola hiện đang hoạt động trên 200 nước khắp thế giới. Thương hiệu Coca-cola luôn là thương hiệu nước ngọt bán chạy hàng đầu và tất cả mọi người trên thế giới đều yêu thích Coca-cola hoặc một trong những loại nước uống hấp dẫn khác của tập đoàn. Ngày nay, tập đoàn Coca-cola đã thành công trong công cuộc mở rộng thị trường với nhiều loại nước uống như sữa trái cây, nước suối, nước tăng lực, nước trà, soda,... với nhiều thương hiệu khác nhau như: Sprite, Fanta, Schweppes, Nutriboost, Teppy, Splash, Aquarius, Fuze Tea, Dasani, Samurai, Barbican,...', 'Image/coca.jpg', 4, 'drink')
 GO
 INSERT INTO post(title, info, image, vote, category) VALUES (N'Trà sữa nướng là loại thức uống được nổi rần rộ trong những ngày vừa qua. Và có nguồn gốc từ Đài Loan, là nơi cho ra đời nhiều hương vị trà sữa số một trên thế giới. Được các bạn trẻ mách nhỏ nhau trên mạng xã hội rất nhiều bởi vì cái tên rất lạ và độc lạ.', N'Nếu các bạn Việt Nam muốn thưởng thức thì oder rất là lâu và giá thành khá đắt đỏ. Bởi vì, trà sữa đã rất được yêu thích khi kết hợp với các loại thạch topping.Bạn cần phải biết rằng trà sữa nướng không phải là đem đi nướng.<br><br>

Điểm nổi bật của loại trà sữa này là thay vì dùng nước đường như trước, người ta thay bằng caramel. Chính vì điều đó, trà sữa nướng có hương  caramel rất đặc trưng. <br><br>

Trà sữa nướng có vị béo nhưng không ngấy, thơm mùi caramel, được cho rằng ngon hơn trà sữa truyền thống. Khi kết hợp với các loại topping thì còn tuyệt vời hơn nữa. <br><br>

Đã là tín đồ mê trà sữa thì chúng tôi khuyên các bạn nên thử loại trà sữa nướng này một lần. Xem thế nào mà lại nổi rần rần mấy ngày qua thế, để rồi có một cái nhận xét thì hãy gửi cho chúng tôi. Dưới đây là công thức làm trà sữa nướng thơm ngon hấp dẫn. Bạn tuyệt đối nên đọc tham khảo chế mà vội lướt qua. Trà sữa nướng thì phải nói có ngon hay không, nhưng khi nghe đến câu từ trà sữa thì bảo đảm với các bạn thì chả có vị trà sữa nào mà không ngon cả.<br><br>

Trà sữa nướng tưởng không ngon nhưng lại ngon không tưởng. Các bạn nên thử một lần cho biết, có khi là nghiện luôn ấy chứ.<br><br>

Nhắc mới nhớ, bạn đang thắc mắc không biết mua nguyên liệu làm trà sữa nướng ở đâu uy tín? Thì xin trả lời, hãy đến Lê Gia chúng tôi. Chúng tôi là đơn vị chuyên cung cấp các nguyên liệu pha chế hàng đầu TP HCM.<br><br>

Nếu bạn có thắc mắc gì về giá cả, nguyên liệu gi. Thì hãy liên hệ với chúng tôi để biết thêm chi tiết nhé!<br><br>

Với các bước thực hiện vô cùng đơn giản thì bạn có thể dễ dàng làm được trà sữa nướng. Cùng với công thức chúng tôi đã chia sẻ và nguyên liệu dễ tìm thì bắt tay thực hiện nào. Chúc các bạn thực hiện thành công với bài công thức chúng tôi chia sẻ nhé!', 'Image/traSuaNuong.jpg', 4, 'drink')
GO
INSERT INTO post(title, info, image, vote, category) VALUES (N'TRÀ CHANH LÀ GÌ? KHOÁ HỌC MENU TRÀ CHANH HOT NHẤT', N'Cách pha trà chanh có khó không?
Cách pha trà chanh không quá khó. Đầu tiên, bạn cần nắm được bý quyết chọn đúng các loại trà ngon chuẩn, vị trà phải thanh và thuần khiết khi kết hợp với chanh. Đó chính là bước quan trọng nhất! Tiếp theo là kỹ thuật pha chế để lưu giữ được hương vị của trà trong vị chanh sảng khoái. Ngoài ra, Menu trà chanh còn có nhiều món HOT mới lạ khác! Bạn đã bao giờ tự hỏi:<br><br>

Đâu là điểm mạnh từ việc bán trà chanh?
Thứ nhất: Chi phí cực thấp. 
Giá vốn cho mỗi ly trà chanh ngon nhất hiện nay chỉ từ 4.000VNĐ - 6.000VNĐ. Với việc sử dụng đúng loại trà đem lại lợi ích cho sức khoẻ và tạo được hương vị lôi cuốn.<br><br>

Thứ hai: Nguyên liệu dễ tìm, dễ chuẩn bị.
Đây là yếu tố cực kỳ thuận lợi cho học viên là chủ quán tại Việt Nam, nhờ đó việc kiểm soát chất lượng trong hương vị trở nên chủ động và dễ dàng hơn. Thứ ba: Thời gian pha chế và phục vụ nhanh chóng.
Điều tiên quyết trên Menu trà chanh chính là thời gian phục vụ. Ngon - bổ - rẻ - tiện lợi - nhanh chóng. Đó chính là những yếu tố tạo nên sự trở lại thành công của trà chanh.<br><br>

Thứ tư: Vốn đầu tư thấp, dễ dàng tham gia.
Với số vốn đầu tư nhỏ chỉ từ 30-70 triệu cho mô hình mang đi (take away) và từ 70-150 triệu cho cửa hàng vừa và nhỏ. Tạo ra nhiều thuận lợi cho chủ quán mới mở. Vừa tiết kiệm được chi phí, vừa thu hút được khách hàng đang theo xu hướng mới! <br><br>

Thứ năm: Dễ dàng kết hợp với các món khác.
Trà chanh xứng đáng là món uống giải khát và thư giãn, do đó việc kết hợp với các món Ăn vặt giúp tăng thêm doanh số và giữ chân được khách hàng lâu hơn. Khách hàng có thể vừa chọn món ăn và món uống dễ dàng tại quán của bạn. Đối với những cửa hàng trà chanh ở miền nam luôn có nhiều ưu thến hơn bởi các món uống này có thể bán được quanh năm. Xem thêm khoá học Menu Ăn vặt tại đây!', 'Image/chaTranh.jpg', 3, 'drink')
GO

INSERT INTO post(title, info, image, vote, category) VALUES (N'Bia là một loại thức uống phổ biến và quen thuộc với nhiều người nhưng không phải ai cũng biết đến nguồn gốc của bia, quá trình phát triển và những ứng dụng tuyệt vời trong cuộc sống mà bia mang đến. Hãy cùng khám phá ngay nhé.', N'Bia là một trong những đồ uống lâu đời nhất của con người. Khi ngũ cốc lần đầu tiên được trồng để làm thức ăn vào hàng ngàn năm trước, có niên đại ít nhất là từ thiên niên kỷ 5 TCN và đã được ghi chép lại trong các thư tịch cổ của Ai Cập cổ đại và Lưỡng Hà. Xung quanh nó cũng có rất nhiều câu chuyện thú vị, người ta cho rằng trong một lần tình cờ khi những hạt gạo bị ướt và lên men quá trình này đã tạo thành một thức uống rất thơm ngon. Từ đó loại bia đầu tiên đã được phát hiện.<br><br>

Tuy nhiên, nhờ kiểm định hóa học các bình gốm cổ người ta phát hiện bằng việc lên men tự nhiên, bia đã được phát minh một cách độc lập giữa các nền văn minh trên toàn thế giới. Và tương tự như rượu vang, bia đã được sản xuất khoảng 7.000 năm TCN ở vùng Lưỡng Hà, Iran ngày nay. Một bức vẽ 6.000 năm tuổi của người Sumeria tại Lưỡng Hà được cho là chứng cứ lâu đời nhất về bia, bởi nó miêu tả hình ảnh những người đang uống một thứ đồ uống từ một cái thùng. Thậm chí còn có một số công thức làm bia từ lúa mạch còn sót lại trong Thiên sử thi Gilgamesh (3.900 năm tuổi) của người Sumeria. Có thể thấy được, ở thế giới phương Tây cổ xưa, đặc biệt là ở Ai Cập và Lưỡng Hà bia đã trở thành thiết yếu.<br><br>

Có một nguồn gốc của bia bia cũng khá thú vị, chuyện kể rằng bia được phát minh bởi một bệnh nhân nghèo, trong một lần vô tình bỏ bánh mì cứng vào ly nước cho mềm để ăn, nhưng ông để quên đến vài ngày sau. Khi đó bánh mì lên men trong ly, do quá đói nên ông vẫn cố ăn và có cảm giác ngây ngất say vì hơi men vài ngày sau thì khỏi bệnh. Nhận thấy sự kì diệu mà thức uống này mang đến, ông đã kiên trì làm thí nghiệm với mong muốn tạo ra phương thức chữa bệnh giúp cho ngành y khoa.<br><br>

Tuy nhiên, do tồn tại đã lâu nên nguồn gốc của bia có thể cũng chỉ là những câu chuyện truyền miệng hoặc sự phỏng đoán dựa trên các dấu vết khảo cổ. Mở đầu cho thời đại của bia không thể bỏ qua người Sumeria, họ có đến 20 hãng sản xuất bia. Ở thời điểm đó do không được lọc nên bia có màu đục, nên khi uống phải dùng ống hút. Dần dần ngành nấu bia được phổ biến sang các nước lân cận trong vùng Lưỡng Hà. Ở triều đại thời Babylon cổ, vua Hammurabi có đạo luật sản xuất bia phân phối cho mọi người như một phần ăn và không được bán mà chỉ trao đổi bằng lúa mạch.<br><br>

Ở thời Cộng hòa La Mã, bia từng được người La Mã yêu thích đã bị hất hủi và chỉ thích hợp cho những người man rợ (Hanibal), khi có sự xuất hiện của rượu vang và được ưa chuộng hơn. Có thể bạn chưa biết, nhưng ở thời Trung cổ các tu viện được coi là nơi sản xuất bia hàng đầu, khi pha chế các tu sĩ thường dùng nhiều loại thảo mộc khác nhau vào bia để cải thiện hương vị, giúp bảo quản lâu hơn.<br><br>

 Hoa bia bắt đầu được trồng và khai thác tại Pháp vào thế kỷ thứ 9, giống hoa này khi pha chế bia sẽ tạo nên vị đắng và bảo quản hương vị lâu hơn. Từ thời Trung cổ ở châu Âu, bia thường được sản xuất trong hộ gia đình. Dần dần đến khoảng thế kỷ 14 và 15, từ việc sản xuất bia theo hộ gia đình được chuyển sang hoạt động thủ công.<br><br>

Ở Anh trong thế kỷ 15, loại bia không chứa hoa bia thường được gọi là ale, bia có chứa hoa bia thì gọi là “bia” – “beer” tiếng Anh. Đến thế kỷ 16, các loại bia có nồng độ cao và bia sử dụng hoa bia đều được gọi là ale.<br><br>

William IV, Công tước xứ Bavaria, đã thông qua Reinheitsgebot (Luật tinh khiết) vào năm 1516. Trước năm 1857, Reinheitsgebot qui định thành phần của bia chỉ bao gồm nước, lúa mạch hoa bia. Đến năm 1857 được bổ sung thêm men bia sau phát kiến của Louis Pasteur (1822-1895).<br><br>

Thời gian sau Reinheitsgebot của người Bavaria đã được áp dụng trong cả nước Đức và đến ngày nay, Reinheitsgebot vẫn được coi là tiêu chuẩn của độ tinh khiết cho bia, mặc dù vẫn còn nhiều tranh cãi xung quanh nó.Đến thế kỷ 16, trong một lần tình cờ khi bia được lưu trữ ở hầm lạnh một thời gian dài, nhờ vậy dòng bia lager (bia lạnh) đã được phát hiện và sản xuất nhiều hơn ale.<br><br>

Vào cuối thế kỷ 19, trong các cuộc cách mạng công nghiệp, việc sản xuất bia nhỏ lẻ không còn đáng kể và được chuyển từ thủ công sang công nghiệp. Đồng thời sự ra đời và phát triển của phù kế – nhiệt kế cũng đã thay đổi việc làm bia. Ngày nay, bia đã trở thành một loại thức uống phổ biến được ưa thích nhất trên thế giới, ngành công nghiệp bia phát triển vượt bật, nó trở thành một nền kinh doanh toàn cầu.', 'Image/bia.jpg', 5, 'drink')
GO

INSERT INTO post(title, info, image, vote, category) VALUES (N'Rượu là gì? Những điều thú vị về rượu có thể bạn chưa biết', N'Trong hoá học, rượu là một chất hữu cơ có chứa nhóm nguyên tố -OH gắn vào nguyên tử cacbon. Nguyên tử cacbon này lại gắn với một hidro hay cacbon khác. Còn trong đời sống thông thường, rượu được hiểu đơn giản là đồ uống có cồn.<br><br>

Rượu được cấu tạo từ nhiền thành phần như nước, ethanol và các tạp chất. Phần tạp chất có bao gồm những độc tố như methanol, aldehyt hay furfurol,… sử dụng quá liều lượng có thể gây hại cho sức khoẻ con người.<br><br>

Lịch sử hình thành của rượu
Nguồn gốc xuất xứ của những chai rượu đầu tiên trên thế giới hay xuất phát bắt nguồn từ quốc gia nào là một điều không ai biết rõ được. Chúng ta chỉ có thể phán đoạn dựa trên những câu chuyện truyền miệng từ lâu đời tại các quốc gia.<br><br>

Các loại thức uống có cồn tại châu Âu được biết đến từ thời tiền sử xa xưa. Còn tại Ai Cập và người Sumer thì cho rằng họ là những người đầu tiên tạo nên bia và dùng những loại men hoang dã để làm ra rượu vang. Đồng thời, họ cũng là những người đầu tiên có ý tưởng dùng rượu trong y học. Còn theo các kết quả khảo cổ học mới nhất đã củng cố cho giả thuyết về người Trung Hoa đã sản xuất rượu từ lâu, khoảng 5000 năm trước Công nguyên. Những dấu ấn tiêu biểu trong phát triển ngành rượu. Từ thời Hy Lạp cổ điển, rượu vang đã xuất hiện trong các bữa sáng và những đêm tiệc rượu. Vào thế kỉ I trước Công nguyên, người La Mã cũng dùng rượu vang trong các bữa ăn. Nhưng lúc bấy giờ, cả người Hy Lạp và La Mã đều pha loãng rượu vang với nước để uống.<br><br>

Từ khoảng thế kỷ VIII – IX, rượu mạnh đã được chưng cất từ rượu vang bởi các nhà giả kim thuật đạo Hồi. Rượu dần được sử dụng rộng rãi thời đó, trong cả cuộc sống hằng ngày của người dân cũng như được áp dụng trong y học. Sau đó, sự du nhập của rượu mạnh vào châu Âu vào giữa thế kỷ XII nhờ các nhà giả kim thuật và từ giữa thế kỷ XIV lượng rượu ngày càng được sử dụng nhiều.<br><br>

Tại Việt Nam, cũng có những loại rượu không thể thiếu trong các dịp lễ Tết hay hội họp, đoàn tụ,…đó là các loại rượu truyền thống được nấu từ lâu đời bằng phương pháp thủ công. Ví dụ như rượu gạo, rượu nếp hay rượu đế,…', 'Image/ruou.jpg', 5, 'drink')
GO

INSERT INTO post(title, info, image, vote, category) VALUES (N'Bột làm bánh bao là bột gì? Có phải bột nào cũng làm bánh bao được?', N'Có nhiều người khi ăn bánh bao đều thắc mắc bột bánh bao là bột gì? Có phải bột nào cũng làm bánh bao được? Ngày hôm nay Bách hóa XANH sẽ giải đáp thắc mắc cho bạn nhé. Bánh bao được nhiều người thích bởi hương vị đậm đà, hấp dẫn. Bánh bao có thể dùng để ăn vào bất cứ bữa ăn nào nhưng lại được các mẹ sử dụng nhiều vào bữa sáng nhất. Ngày hôm nay cùng chúng mình tìm hiểu về bột làm bánh bao để bạn có thể chọn cho mình loại bột thích hợp và tự làm bánh bao tại nhà nhé. Bánh bao thường được làm từ bột mì, loại bột được xay từ lúa mì nguyên chất. Bột làm bánh bao là loại bột đã được xay mịn, trắng.<br><br>

Khi chế biến thì người ta sẽ thêm một chút bột nở (chia tỷ lệ theo công thức làm bánh) vào để bột nở ra. Khi hấp hoặc chiên thì sẽ ngon hơn. Như bạn cũng biết bánh bao được làm từ bột mì. Tuy nhiên mỗi loại bột mì sẽ khác nhau ở hàm lượng Protein. Mỗi loại bột mì làm bánh bao sẽ chứa Protein khác nhau và sau khi tiếp xúc với nước cùng với nhiệt độ sẽ sản sinh ra Gluten - một loại chất giúp men nở ra và co giãn cho bánh. Hãy cùng chúng mình tìm hiểu nhé: Đây chắc chắn là loại nguyên liệu được sử dụng nhiều trong việc chế biến bánh ngọt. Và bánh bao cũng được sử dụng loại bột mì này. Hàm lượng Gluten trong bột mì đa dụng chiếm khoảng 9,5% - 11,5%. Đây là loại bột được sử dụng để làm các loại bánh có độ xốp nhiều. Sau khi làm xong thì bánh mềm, nhẹ như cheesecake, bánh gato. Cake Flour là loại bột rất mịn và có hàm lượng Gluten thấp, khoảng 7,5% - 8,75%. Loại bột này dùng để làm bánh mì vỏ cứng, pizza,... Bột Bread flour có hàm lượng Gluten cao từ 11.5 – 13%. Bột Pastry có màu trắng kem và hàm lượng Gluten thấp khoảng 9%. Loại bột này thường dùng để làm vỏ bánh pie, tart, cookies, bánh quy và muffins. Đây là loại bột theo công thức làm bánh của Singapore và Malaysia. Theo như công ty sản xuất dòng bột này siêu mềm, thích hợp làm bánh bao. Loại bột này thích hợp làm bánh bao kim sa. Bạn hãy thử nhé.<br><br>

Hy vọng với những thông tin trên đã giúp bạn hiểu hơn về các loại bột làm bánh bao rồi nhé. Tùy vào hàm lượng Gluten trong mỗi loại bột khác nhau nên công thức chế biến làm bánh bao sẽ khác nhau, thế nên các loại bột mì đều có thể làm bánh bao được. Nếu bạn còn biết thêm thông tin gì thì hãy để lại bình luận để chúng mình biết nhé.', 'Image/banhBao.jpg', 4, 'food')
GO

INSERT INTO post(title, info, image, vote, category) VALUES (N'BÁNH CHƯNG – BIỂU TƯỢNG TRUYỀN THỐNG ẨM THỰC NGÀY TẾT VIỆT NAM', N'“Thịt mỡ dưa hành câu đối đỏ
Cây nêu, tràng pháo, bánh chưng xanh”

Đó là đôi câu đối thân quen khi nói về những nét đặc trưng nhất trong ngày Tết nguyên đán của người Việt từ bao đời nay. Trong đó, chiếc bánh chưng xanh đã trở thành biểu tượng ẩm thực truyền thống mỗi dịp Tết của cả dân tộc và được bạn bè khắp năm châu biết đến. Với người dân Việt Nam, cứ mỗi dịp Tết đến Xuân về, trong nhà mà không có bánh chưng hẳn như sẽ thiếu đi cả cái không khí Tết. Cứ vào những ngày giáp Tết, các gia đình Việt lại có phong tục gói bánh chưng như duy trì một nét đẹp văn hóa truyền thống lâu đời. Ngoài ra, người Việt cũng gói bánh chưng trong ngày giỗ tổ Hùng Vương hàng năm vào ngày mùng 10 tháng 3 Âm lịch. <p>Ý nghĩa bánh chưng trong ngày Tết cổ truyền của người Việt
Theo quan niệm từ thời xa xưa, chiếc bánh chưng của người Việt có hình vuông, tượng trưng cho đất. Bánh chưng được làm từ gạo nếp trắng ngần với phần nhân có đậu xanh, thịt mỡ, hành, tiêu…  Tất cả được bọc trong lớp lá dong xanh mướt và được buộc chặt bằng những sợi lạt mềm dẻo với tạo hình vuông vức, đẹp mắt.</p>

Người Việt Nam từ xa xưa đã sống trong nền văn hóa lúa nước, phải phụ thuộc thiên nhiên rất nhiều. Vì thế, chiếc bánh chưng trong mâm cỗ ngày Tết mang ý nghĩa thể hiện sự biết ơn trời đất đã cho mưa thuận gió hòa để mùa màng bội thu, đem lại cuộc sống ấm no cho người dân. Không chỉ thế, bánh chưng ngày Tết còn được bày lên bàn thờ cúng để thể hiện lòng hiếu kính của con cháu với tổ tiên cùng những người đã khuất. Bánh chưng cũng là món quà biếu Tết ý nghĩa mà người Việt thường dùng để đi biếu người quen, họ hàng hoặc được bày cùng các vật dụng khác trên mâm ngũ quả ngày Tết để thể hiện cho sự tương sinh tương khắc trong ngũ hành.

<p>Thấy bánh chưng là thấy Tết! Vậy nên người Việt dù ở đâu, làm gì, vẫn luôn mong ngóng được trở về quây quần bên gia đình, cùng nhau học cách làm bánh chưng hay ngồi canh nồi bánh sôi sục, nóng hổi trên bếp lửa để cảm nhận không khí Tết đang ùa về. Cùng kể nhau nghe những câu chuyện xưa cũ rồi hít hà mùi hương thơm lừng hòa quyện từ lá dong, gạo nếp cái hoa vàng cùng vị ngọt bùi của đậu xanh, vị ngậy béo của nhân thịt trong chiếc bánh chưng – hương vị Tết không thể lẫn vào đâu được.</p>', 'Image/banhChung.jpg', 4, 'food')
GO

INSERT INTO post(title, info, image, vote, category) VALUES (N'Bánh rán thức ăn thơm ngon', N'<p>Bánh rắn ăn nóng, vi bùi ngọt tinh tuý của gạo tẻ, béo ngậy của thịt lợn, mùi thơm của hành... thưởng thức cùng chút nước mắm nguyên chất, thêm chút ớt tươi tê tê đầu lưỡi hẳn không ai có thể quên được.</p>

<p>Nằm ở phía tây bắc của "vựa lúa Thái Bình", Hưng Hà quê tôi không thiếu những món quà quê dân dã làm từ lúa, trong đó phải kể đến bánh đa Làng Me, bánh chưng phố Lẻ, và nhất là bánh rắn Đô Kỳ</p>

<p>Không nổi tiếng khắp mọi miền như bánh giò, bánh tẻ, bánh khoai sọ... mà bạn có thể tìm thấy ở bất cứ hàng quà vặt nào của đất Hà Thành, bánh rắn quê tôi khiêm nhường ở lại như một cách riêng để níu giữ những người con của quê hương, dù đi xa nơi đâu cũng nhớ tới.</p> <p>Bánh rắn được làm bằng gạo tẻ hạt đều, ngâm nước mưa 4- 5 tiếng cho mềm rồi đem xay mịn. Công đoạn tiếp theo là cho bột vào lọc khô và nhào nhuyễn đến khi bột không dính tay.</p>

<p>Nhân bánh cũng không cầu kỳ, thịt đủ mỡ và nạc rửa sạch, luộc qua và thái dài khoảng 3 cm, hành khô bóc lớp vỏ ngoài đập dập, cho vào chảo mỡ nóng già phi vàng. Trộn hành khô vàng rộm vào thịt đã thái sẵn, ướp chút gia vị, nước mắm vừa ăn, thêm chút dọc hành tươi cũng đủ dậy mùi, mê đắm lòng người.</p>

<p>Mùa nào thứ ấy, khi thì lá rong, khi thì lá chuối, rửa sạch từng tàu, để ráo, lau thật khô. Trải tấm lá xanh mát, đầy ắp thiên nhiên xanh sạch, nắm một nắm bột vừa đủ đặt dọc thân lá, cho nhân thịt hành vào giữa, nắn tròn tay, dọc theo sống lá. Nhìn đôi tay thoăn thoắt của người làm bánh chợ Đô Kỳ gập hai đầu lá mới thấy hết nghê thuật của người gói bánh. Bánh gói xong được giữ bằng những sợi rơm, hoặc dây chuối phơi khô tước nhỏ, quấn quanh thân.</p>

<p>Đặt những chiếc bánh gói đều tay xinh xắn vào cái mẹt tre, chờ nồi nước sôi sùng sục thả bánh vào, đun vừa lửa khoảng 3- 4 tiếng để bánh rắn nhưng không cứng, mềm nhưng không nhũn. Vớt bánh ra rổ cho ráo nước rồi ủ nóng kịp cho buổi chợ sớm tinh sương.</p>

<p>Bánh rắn ăn nóng, vị bùi ngọt tinh tuý của gạo tẻ, béo ngậy của thịt lợn, mùi thơm của hành... thưởng thức cùng chút nước mắm nguyên chất, thêm chút ớt tươi tê tê đầu lưỡi hẳn không ai có thể quên được.</p>

<p>Trẻ con bây giờ không còn niềm vui mong ngóng như lũ trẻ chúng tôi ngày trước. "Mong như mong mẹ về chợ", làm việc gì cũng nhấp nha nhấp nhổm ngóng ra ngõ. Reo hò vui sướng khi thấy bóng mẹ lấp ló sau luỹ tre triền đê, trong chiếc thúng úp chiếc nón lá, khi là tấm mía, khi là chiếc bánh rán vừng thơm phưng phức, nhưng không khi nào chiếc bánh rắn nóng hôi hổi.</p>', 'Image/banhRan.jpg', 5, 'food')
GO
INSERT INTO feedback (name, content, [date], postId) VALUES
('user1', N'Thật tuyệt vời', '2023-03-15', 1),
('user4', N'Hay quá', '2023-03-15', 1),
('user7', N'Hay lắm', '2023-03-15', 1),
('user1', N'Thật tuyệt vời', '2023-03-15', 2),
('user5', N'Tôi yêu bạn', '2023-03-15', 3),
('user2', N'Bạn không làm tôi thất vọng', '2023-03-15', 3),
('user1', N'Thật tuyệt vời', '2023-03-15', 2),
('user5', N'Tôi yêu bạn', '2023-03-15', 2),
('user2', N'Bạn không làm tôi thất vọng', '2023-03-15', 9),
('user1', N'Thật tuyệt vời', '2023-03-15', 9),
('user5', N'Tôi yêu bạn', '2023-03-15', 10),
('user2', N'Bạn không làm tôi thất vọng', '2023-03-15', 10)
