# WebTuThien
1. Mô tả dự án

Dự án quyên góp từ thiện sẽ đưa lên thông tin những hoàn cảnh khó khăn, cần sự giúp đỡ của những nhà hảo tâm, thiện nguyện. Giúp bạn dễ dàng chung tay quyên góp tiền cùng hàng triệu người, giúp đỡ các hoàn cảnh khó khăn trên khắp cả nước. Ngoài ra, người quản lý (admin) có thể theo dõi được thông tin của các đợt quyên góp thông qua: trạng thái đợt quyên góp, số tiền của đợt quyên góp, thông tin cơ bản của những người tham gia quyên góp ,...

Để hình dung tổng quát nhất, bạn có thể theo dõi một trang web mẫu tại đây.

2. Thiết kế giao diện

Về mặt giao diện sẽ không yêu cầu quá phức tạp. Học viên có thể tải source code của giao diện của dự án tại đây.

Minh họa màn hình trang chủ rõ ràng và hiển thị đủ thông tin chức năng cần tương ứng.



3. Yêu cầu về cơ sở dữ liệu

Về mặt cơ sở dữ liệu, học viên sẽ phải tự thiết kế, bạn hãy phân tích yêu cầu của dự án để xây dựng cơ sở dữ liệu mà đơn giản hóa chức năng, đáp ứng đủ những yêu cầu của bài toán đưa ra. Ngoài ra, bạn có thể tham khảo diagram dưới đây:



Lưu ý: Không cần phải phát triển cơ sở dữ liệu giống 100% ở dưới đây, chỉ cần phân tích được những thực thể, thể hiện rõ mối quan hệ của từng đối tượng và đáp ứng đủ chức năng của bài toán đưa ra

4. Tổ chức dự án

Về mặt xây dựng và tổ chức dự án, học viên sẽ phải tự thiết kế theo mô hình khuôn mẫu của MVC, tức là sẽ có các lớp package như: model, view, controller, config, ... Dưới đây là một khuôn mẫu phát triển theo hướng Spring MVC.



Lưu ý: Việc bạn xây dựng và tổ chức dự án theo hướng Spring Boot, Spring Cloud, ... không ảnh hưởng gì cả, MIỄN phân chia và quản lý rõ ràng từng nhiệm vụ của các package cần xử lý.

5. Yêu cầu chức năng cơ bản:

Dự án không phân chia theo quyền NHƯNG phân chia theo mặt chức năng hệ thống
Ví dụ: Người quản lý hệ thống - Admin, Người dùng chức năng hệ thống - User, ...

Một đợt quyên góp sẽ được diễn ra thông qua 4 trạng thái cơ bản chính:
Trạng thái mới tạo: Đợt quyên góp vừa mới được khởi tạo chưa bắt đầu chạy quyên góp. Người dùng hệ thống sẽ khởi tạo đợt quyên góp.
Đang quyên góp: Đợt quyên góp đang được quyên góp. Người dùng hệ thống có thể tham gia đợt quyên góp này.
Kết thúc đợt quyên góp: Đợt quyên góp hoàn thành mục tiêu, có thể là về thời gian hoặc số tiền cần quyên góp. 
Đóng quyên góp: Đóng đợt quyên góp, không ai có thể tham gia quyên góp được nữa và trạng thái của đợt quyên góp sẽ KHÔNG thể thay đổi được.
Lưu ý: Chỉ có duy nhất người quản trị hệ thống (Admin) mới có quyền thay đổi trạng thái của đợt quyên góp, có thể thay đổi các trạng thái luân phiên nhau NHƯNG ở trạng thái ‘Đóng quyên góp’ sẽ không quay trở lại trạng thái ‘Kết thúc đợt quyên góp’ hay ‘Đang quyên góp’ được cả.

5.1. Chức năng 1: Quản lý người dùng (dành cho Admin)

5.1.1. Hiển thị ra danh sách của người dùng

Một danh sách của người dùng ở trong hệ thống sẽ được hiển thị ra khi người quản trị hệ thống (Admin) sẽ lựa chọn vào mục “Quản lý người dùng”.

Danh sách của người dùng trong hệ thống sẽ bao gồm các thông tin sau:

Họ và tên người dùng
Email cá nhân: email phải đúng định dạng email tương ứng
Số điện thoại: số điện thoại phải đúng đúng định dạng tương ứng
Tài khoản
Vai trò: sẽ tồn tại 2 vai trò chính trong hệ thống là: người quản lý hệ thống (Admin) và người dùng cơ bản (User)
Trạng thái: Có hai trạng thái cơ bản trong hệ thống là: Hoạt động và Đã khóa. Ở trạng thái “Hoạt động” thì người dùng có thể sử dụng hệ thống cơ bản. Ở trạng thái “Đã khóa” thì người dùng không sử dụng những chức năng cơ bản của hệ thống.
Hành động: Mô tả các hành động (nút ấn) của hệ thống như: Sửa (cập nhật thông tin), Chi tiết, Xóa, Khóa


Đi kèm với danh sách của đợt quyên góp sẽ là những nút ấn tương ứng như là: thêm mới, tìm kiếm, phân trang, ...

Về chức năng phân trang, bạn phải giới hạn được bao nhiêu người dùng có thể hiển thị trên một danh sách, có thể là 5,10,15, ... nhưng hãy giới hạn cho người dùng biết đang có người dùng đang có trên danh sách và giới hạn số lượng hiển thị.

Ví dụ: Ở ảnh trên đang giới hạn là 10 người dùng được cho phép hiển thị trên 1 trang, nhưng đang chỉ có 3 người dùng được hiển thị tương ứng.

5.1.2. Thêm mới một người dùng

Một người dùng mới sẽ được khởi tạo, khi người quản lý hệ thống (Admin) sẽ thêm mới một người dùng trong hệ thống

Thông tin của một người dùng về cơ bản sẽ gồm có:

Họ và tên
Email
Số điện thoại
Địa chỉ
Tài khoản
Mật khẩu
Vai trò: lựa chọn 2 vai trò cơ bản: Admin và User


Đi kèm với thông tin của một người dùng sẽ là 2 nút ấn xử lý:

Nút ấn “Thêm”: Ấn vào để xác nhận việc thêm mới một người dùng.
Nút ấn “Đóng”: Ấn vào để xác nhận đóng form (biểu mẫu) của một người dùng.
5.1.3. Tìm kiếm thông tin người dùng qua số điện thoại hoặc email

Việc tìm kiếm một người dùng theo qua email hoặc số điện thoại sẽ giúp cho người quản trị hệ thống (Admin) sẽ lọc được thông tin của người dùng đó. Có thể theo dõi vào những thông tin cơ bản của người dùng tương ứng đó.

Lưu ý: Khi bạn tìm kiếm dựa vào email hoặc số điện thoại, bạn sẽ có 2 cách xử lý:

Bạn PHẢI nhập đủ số điện thoại của người dùng rồi mới ấn “Enter” hoặc “Tìm kiếm” thì mới ra được những thông tin đó tương ứng.
Ví dụ: Bạn muốn tìm kiếm thông tin của người dùng có số điện thoại là “0282910921” thì bạn phải ghi đủ là “0282910921” vào ô nhập tìm kiếm rồi ấn “Enter” hoặc “Tìm kiếm” thì mới ra được thông tin của người dùng tương ứng đó.

Bạn CHỈ cần nhập vài số đầu trong số điện thoại thì sẽ ra luôn những những người mang số đó (một số người dùng sẽ có có một vài số đầu trùng nhau).
Ví dụ: Bạn muốn tìm kiếm thông tin của người dùng có số điện thoại là “0282910921” thì bạn CHỈ cần ghi vào ô tìm kiếm “02829” thì lập tự sẽ hiển thị ra những người có số đầu điện thoại là số “02829”, cũng có trường hợp ra luôn thông tin người dùng.



5.1.4. Cho phép/không cho phép một người dùng sử dụng hệ thống

Chức năng cho phép/không cho phép một người dùng sử dụng hệ thống sẽ giống như việc bạn muốn ngăn chặn một số người dùng vào hệ thống tương ứng. Ở trong hệ thống dưới đây sẽ là Khóa/Mở.

Ở trạng thái “Khóa” thì người dùng được chuyển từ trạng thái “Hoạt động” sang trạng thái “Đã khóa” tương ứng. Người dùng sẽ không thể truy cập vào hệ thống và thực hiện được chức năng tương ứng (Sẽ rất giúp ích cho về sau này nâng cấp lên hệ thống cần phải có đăng nhập).

Ở trạng thái “Mở” thì người dùng sẽ được chuyển từ trạng thái “Đã khóa” sang trạng thái “Hoạt động” tương ứng. 



Lưu ý: Ở trạng thái nào sẽ hiển thị ra nút ấn tương ứng ở trạng thái đó. 

Ví dụ: Ở trạng thái “Đã khóa” thì chỉ hiển thị ra nút ấn “Mở”, KHÔNG hiển thị ra nút ấn “Khóa”, tương tự đối với trạng thái “Hoạt động”.

5.1.5. Xóa một người dùng

Người quản trị hệ thống (Admin) hoàn toàn có thể xóa một người ra khỏi hệ thống. (Xóa hoàn toàn dữ liệu).

Khi bạn ấn vào nút “Xóa” thì sẽ phải hiển thị ra một pop-up để ra thông tin tên của người dùng cũng như là phải xác nhận xem thực sự bạn có muốn xóa người dùng đó đi hay không.



Ở đây sẽ có 2 nút ấn tương ứng:

Nút “Close”: khi bạn nhấn nút Close sẽ đóng lại pop-up xóa tương ứng.
Nút “Xóa”: thực hiện chức xóa người dùng trong hệ thống cho bạn.
5.1.6. Cập nhật thông tin người dùng

Việc cập nhật thông tin của người dùng sẽ giúp cập nhật những thông tin mang tính sai lệch lớn, ví dụ có thể là số điện thoại, địa chỉ, ... Việc này cũng có thể cập nhật ở phía người dùng tự làm. Ở đây để đáp ứng chức năng về CRUD nên vẫn sẽ có việc cập nhật thông tin.

Cập nhật thông tin sẽ bao gồm:

Họ và tên
Số điện thoại
Địa chỉ
Vai trò: Vai trò sẽ thực hiện lựa chọn 2 vai trò chính là: User và Admin


Còn 2 trường thông tin là tài khoản và email sẽ mang tính chất “Đăng nhập hệ thống” nên sẽ không được sửa hay cập nhật từ phía người quản trị hệ thống.

Ở đây sẽ có 2 nút ấn tương ứng:

Nút “Đóng”: khi bạn nhấn nút “Đóng” sẽ đóng lại pop-up xóa tương ứng.
Nút “Lưu”: thực hiện việc cập nhật thông tin trong hệ thống cho bạn.
Ngoài ra, bạn có thể làm thêm chức năng hiển thị chi tiết thông tin người dùng. Việc này có thể xem được toàn bộ thông tin khái quát nhất của người dùng đang mang.

5.2. Chức năng 2: Quản lý đợt quyên góp (dành cho Admin)

5.2.1. Hiển thị ra danh sách của đợt quyên góp

Một danh sách của các đợt quyên góp đã ở trong hệ thống sẽ được hiển thị ra khi người quản trị hệ thống (Admin) sẽ lựa chọn vào mục ‘Quản lý đợt quyên góp’.

Danh sách của các đợt quyên góp sẽ bao gồm các thông tin như sau:

Mã đợt quyên góp
Tên đợt quyên góp
Ngày bắt đầu đợt quyên góp
Ngày kết thúc đợt quyên góp
Tổ chức từ thiện
Số điện thoại
Tổng tiền của đợt quyên góp
Trạng thái của đợt quyên góp
Hành động tương ứng (cập nhật đợt quyên góp, chi tiết đợt quyên góp, kết thúc đợt quyên góp, ...)


Đi kèm với danh sách của đợt quyên góp sẽ là những nút ấn tương ứng như là: thêm mới, tìm kiếm, phân trang, ...

5.2.2.Thêm mới một đợt quyên góp:

Một đợt quyên góp sẽ được khởi tạo, khi người quản lý hệ thống (Admin) sẽ thêm mới một đợt quyên góp tương ứng trong hệ thống.

Thông tin của một đợt quyên góp về cơ bản sẽ gồm có:

Mã đợt quyên góp
Tên đợt quyên góp
Ngày bắt đầu
Ngày kết thúc
Tổ chức
Số điện thoại
Nội dung của đợt quyên góp


Đi kèm với thông tin của một đợt quyên góp sẽ là 2 nút ấn xử lý:

Nút ấn “Thêm”: Ấn vào để xác nhận việc thêm mới một đợt quyên góp.
Nút ấn “Đóng”: Ấn vào để xác nhận đóng form (biểu mẫu) của một đợt quyên góp.
5.2.3. Tìm kiếm một đợt quyên góp dựa vào trạng thái của đợt quyên góp: mới tạo, đang quyên góp, kết thúc quyên góp và đóng quyên góp

Việc tìm kiếm đợt quyên góp theo trạng thái sẽ giúp cho người quản trị hệ thống (Admin) sẽ lọc được thông tin của đợt quyên góp đó. Có thể theo dõi vào những đợt quyên góp mà mình cần quan tâm như: đang quyên góp hoặc đóng quyên góp, ...

Lưu ý: Khi bạn tìm kiếm dựa vào trạng thái một đợt quyên góp bạn sẽ có 2 cách xử lý:

Bạn PHẢI nhập đủ trạng thái của đợt quyên góp rồi mới ấn “Enter” hoặc “Tìm kiếm” thì mới ra được những đợt quyên góp ở trạng thái đó tương ứng.
Ví dụ: Bạn muốn tìm kiếm đợt quyên góp ở trạng thái “Đang quyên góp” thì bạn PHẢI điền vào ô nhập là “Đang quyên góp” sau đó ấn “Enter” hoặc “Tìm kiếm” thì nó sẽ lọc ra cho bạn luôn những đợt quyên góp là đang ở trạng thái là đang quyên góp.

Bạn CHỈ cần nhập vài từ trong đợt quyên góp đó thì sẽ ra luôn những đợt quyên góp ở trạng thái đó tương ứng.
Ví dụ: Bạn muốn tìm kiếm đợt quyên góp ở trạng thái “Đang quyên góp” thì bạn chỉ cần điền vào ô nhập là “Đang quyên” thì nó sẽ lọc ra cho bạn luôn những đợt quyên góp đang ở trạng thái là đang quyên góp.



Hai cách tìm kiếm trên bạn có thể linh hoạt sử dụng một trong hai đều được cả, nhưng so về tính thực thế và thuận tiện thì cách số 2 được sử dụng rộng rãi hơn.

5.2.4. Tìm kiếm một đợt quyên góp dựa vào số điện thoại cá nhân, tên tổ chức và mã số của đợt quyên góp

Việc tìm kiếm thông tin của đợt quyên góp sẽ hỗ trợ tốt cho người quản lý hệ thống hơn khi lọc (filter) được nhiều giá trị được tìm kiếm hơn, cụ thể ở đây sẽ là: số điện thoại cá nhân, tên tổ chức và mã số của đợt quyên góp.

Việc tìm kiếm cũng như phương pháp tìm kiếm cũng giống như tìm kiếm theo trạng thái của đợt quyên góp (5.2.3).

Tìm kiếm theo số điện thoại cá nhân:


Tìm kiếm theo mã số của đợt quyên góp:


5.2.5. Xóa một đợt quyên góp ở trạng thái ‘mới tạo’

Ở trạng thái mới tạo đợt quyên góp (tức là mới thêm mới một đợt quyên góp) thì sẽ được xóa đợt quyên góp đó tương ứng. 

Khi bạn ấn vào nút “Xóa” thì sẽ phải hiển thị ra một pop-up để ra thông tin tên của đợt quyên góp cũng như là phải xác nhận xem thực sự bạn có muốn xóa đợt quyên góp đó đi hay không.



Ở đây sẽ có 2 nút ấn tương ứng:

Nút “Close”: khi bạn nhấn nút Close sẽ đóng lại pop-up xóa tương ứng.
Nút “Xóa”: thực hiện chức xóa đợt quyên góp trong hệ thống cho bạn.
Lưu ý: Khi bạn xóa một đợt quyên góp, dữ liệu rất quan trọng trong một hệ thống, dù nó có hiển thị dưới dạng gì đi chăng nữa, thế cho nên khi bạn đã có một thông tin trong cơ sở dữ liệu mà bạn muốn ‘xóa’ nó, làm biến mất nó thì sẽ có 2 cách xử lý:

Bạn sẽ sử dụng cú pháp thông thường khi thao tác với cơ sở dữ liệu là: DELETE.
Khi bạn ấn vào nút xóa, tức là bạn chỉ đang CHỈ cập nhật lại thông tin dữ liệu của trường đó mà thôi.
Ví dụ: Trong cơ sở dữ liệu, mỗi thông tin của đợt quyên góp bạn muốn hiển thị ra danh sách bạn để là “TRUE”, khi bạn muốn xóa một thông tin bất kỳ, bạn chỉ cần UPDATE lại thông tin đó sang “FALSE”. Việc này sẽ tránh bạn mất dữ liệu và cũng như không làm ảnh hưởng tới hệ thống tương ứng.

Hai cách xóa đợt quyên góp trên bạn có thể linh hoạt sử dụng một trong hai đều được cả, nhưng so về tính thực thế và thuận tiện thì cách số 2 được sử dụng rộng rãi hơn.

5.2.6. Cập nhật thông tin của một đợt quyên góp khi chưa ở trạng thái ‘đóng quyên góp’

Khi đợt quyên góp CHƯA ở trạng thái ‘đóng quyên góp’ thì sẽ được tiến hành việc cập nhật nếu như người quản lý hệ thống muốn. Việc cập nhật thông tin của đợt quyên góp sẽ chỉnh sửa bổ sung một số thông tin của đợt quyên góp bao gồm: tên đợt quyên góp, số điện thoại, ...



Ở mỗi đợt quyên góp (ngoại trừ đợt quyên góp mang trạng thái ‘Đóng quyên góp’ ra, sẽ có nút “Cập nhật”, nhấn vào nút sẽ hiển thị một ô pop-up đi kèm với thông tin của đợt quyên góp đó. Tiến hành thay đổi thông tin tương ứng và ấn nút “Lưu” sẽ thực hiện cập nhật đợt quyên góp đó.

5.2.7. Xem chi tiết thông tin của đợt quyên góp

Mỗi đợt quyên góp dù là ở bất kì trạng thái gì sẽ có nút “Chi tiết” để có thể thực hiện việc xem chi tiết thông tin của đợt quyên góp đó.

Thông tin chi tiết của một đợt quyên góp bao gồm:

Mã đợt quyên góp
Tên đợt quyên góp
Ngày bắt đầu của đợt quyên góp
Ngày kết thúc của đợt quyên góp
Tổng số tiền quyên góp thu được
Trạng thái của đợt quyên góp
Tổ chức từ thiện
Số điện thoại
Nội dung của đợt quyên góp
Lưu ý: Tất cả thông tin của đợt quyên góp chỉ xem chứ không chỉnh sửa được.

Ngoài ra, ở chi tiết đợt quyên góp nên hiển thị thêm danh sách của những người quyên góp ở đây. Để có thể xem được thông tin, số tiền người ủng và cũng như trạng thái xác nhận số tiền tương ứng. Danh sách của những người quyên góp vẫn đủ thông tin như: Họ và tên, Tên đợt quyên góp, Ngày quyên góp, Nội dung, Trạng thái và Hành động, cũng như là có phân trang và ô tìm kiếm thông tin tương ứng.



5.2.8. Thay đổi trạng thái của một đợt quyên góp

Tất cả trạng thái của một đợt quyên góp đã nói ở phần yêu cầu chức năng cơ bản (2.5), học viên có thể xem lại ở phần trên. Và ở mỗi trạng thái chỉ có hiển thị những trạng thái kế tiếp tương ứng, chứ không được ‘nhảy’ trạng thái (tức là phải và trải qua lần lượt).

Ví dụ: Ở trạng thái ‘Mới tạo” thì trong cột hành động sẽ có hiển thị nút ấn “Quyên góp” để khi ấn sẽ chuyển đổi trạng thái sang “Đang quyên góp” mà thôi chứ không được hiển thị thêm các nút ấn như “Kết thúc” hay là “Đóng”.



5.3. Chức năng 3: Thực hiện quyên góp (dành cho User)

5.3.1. Hiển thị danh sách của các đợt quyên góp

Ở màn hình trang chủ sẽ hiển thị ra các đợt quyên góp đang có tương ứng, đi kèm với một số thông tin cơ bản của đợt quyên góp đó như:

Tên đợt quyên góp
Trạng thái đợt quyên góp
Ngày bắt đầu và ngày kết thúc
Tên tổ chức và số điện thoại


Duy nhất ở trạng thái “Đang quyên góp” thì mới được hiển thị thêm nút ấn “Quyên góp”, việc này giúp cho người dùng có thể theo dõi được tổng quan những đợt quyên góp nào đang được quyên góp.

Về danh sách đợt quyên góp sẽ CHỈ NÊN hiển thị 5 đợt quyên góp trên một trang chủ, hiển thị quá nhiều (cụ thể là lớn hơn 5) sẽ khiến cho người dùng rất khó và theo dõi được tổng quan.

5.3.2. Xem chi tiết thông tin của một đợt quyên góp

Khi thực hiện ấn vào tên đợt quyên góp sẽ chuyển đến xem chi tiết của đợt quyên góp đó. Chi tiết đợt quyên góp ở phía người dùng hệ thống sẽ bao gồm:

Nội dung của đợt quyên góp
Danh sách những người đã tham gia quyên góp cho đợt quyên góp đó
Thông tin cơ bản của đợt quyên góp:
Mã đợt quyên góp
Tên đợt quyên góp
Ngày bắt đầu
Ngày kết thúc
Cá nhân/tổ chức
Số điện thoại
Tổng tiền quyên góp nhận được
Trạng thái của đợt quyên góp


5.3.3. Thực hiện quyên góp nhanh mà không cần xem chi tiết thông tin đợt quyên góp

Ở màn hình trang chủ đã liệt kê ra danh sách của những đợt quyên góp. Những đợt quyên góp nào đang ở trạng thái “Đang quyên góp” sẽ có nút ấn “Quyên góp” tương ứng. Thực hiện nhấn vào sẽ mở ra pop-up về thông tin muốn quyên góp đợt quyên góp đó.



Thông tin để để thực hiện quyên góp cho một đợt quyên góp sẽ bao gồm:

Họ và tên của người quyên góp
Số tiền quyên góp
Lời nhắn (thông điệp) muốn gửi gắm tới
Ở đây sẽ có 2 nút ấn tương ứng:

Nút “Quyên góp”: thực hiện việc quyên góp tương ứng.
Nút “Đóng”: thực hiện đóng pop-up quyên góp tương ứng.
6. Yêu cầu chức năng nâng cao

6.1. Xác nhận/hủy xác nhận với việc nhận được tiền từ nhà quyên góp theo cách làm thủ công (dành cho người quản lý hệ thống)

Việc xác nhận/hủy xác nhận đối với số tiền của nhà hảo tâm đều được xử lý bởi người quản lý hệ thống (Admin). Tại sao phải cần điều đó xảy ra? Bởi vì hệ thống khi thanh toán số tiền quyên góp thì không tích hợp với các app thứ ba như (Momo, VNPay, ...), việc làm như vậy sẽ khiến chức năng sẽ rất khó nhưng cũng làm tăng tính xác thực của bài toán. Đây sẽ là hướng đi nâng cao và bổ sung để học viên phát triển hệ thống hơn sau này.

Còn hiện tại chức năng hệ thống chỉ dừng lại là người dùng nhập tên, số tiền, nội dung quyên góp sau đó quyên góp. Việc còn lại là người quản trị hệ thống sẽ xác minh thông qua “Xác nhận” khi chuyển khoản thành công với nội dung chuyển khoản tương ứng, ...



Lưu ý: Khi ấn “Xác nhận” thì trạng thái cũng sẽ thay đổi từ “Chờ xác nhận”  sang “Đã xác nhận”. Đồng thời số tiền trong đợt quyên góp cũng sẽ tăng lên theo. 

6.2.Thực hiện quyên góp khi xem thông chi tiết của một đợt quyên góp (dành cho người dùng hệ thống)

Khi muốn thực hiện quyên góp mà cần phải xem chi tiết thông tin của một đợt quyên góp đó thì cần phải truy cập trực tiếp vào đợt quyên góp đó. Lựa chọn nút ấn “Quyên góp” để có thể mở ra cửa sổ pop-up để thực hiện việc quyên góp.



Thông tin thực hiện việc quyên góp vẫn bao gồm:

Họ và tên của người muốn quyên góp
Số tiền quyên góp
Lời nhắn (thông điệp) muốn gửi gắm
