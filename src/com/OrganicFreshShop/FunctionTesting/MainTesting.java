//package com.OrganicFreshShop.FunctionTesting;
//
//import com.OrganicFreshShop.daoImplements.AccountDAOImplement;
//import com.OrganicFreshShop.daoImplements.OrderDAOImplement;
//import com.OrganicFreshShop.daoImplements.ProductDAOImplement;
//import com.OrganicFreshShop.model.*;
//import com.OrganicFreshShop.util.Utils;
//import org.springframework.jdbc.datasource.DriverManagerDataSource;
//
//import javax.servlet.http.HttpServletRequest;
//import java.sql.Timestamp;
//import java.util.*;
//
///**
// * Created by root on 11/24/16.
// */
//public class MainTesting {
//
//    public static void main( String... args ) {
//
//        Random random = new Random();
//        DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
//        driverManagerDataSource.setDriverClassName("org.mariadb.jdbc.Driver");
//        driverManagerDataSource.setUrl("jdbc:mysql://127.0.0.1:3306/OrganicFreshShop");
//        driverManagerDataSource.setUsername("root");
//        driverManagerDataSource.setPassword("");
//
////        Product DAO TEST
//        System.out.println("******Product DAO");
//        ProductDAOImplement productDAOImplement = new ProductDAOImplement( driverManagerDataSource );
//
//        System.out.println("\n\n\n-------------Test fetch All product------------------");
//        List<Product> list = productDAOImplement.fetchAllProducts();
//        for ( Product product : list ) {
//            System.out.println( product );
//        }
//
//        System.out.println("\n\n\n---------------Test Paginator---------------------------");
//        PaginatorResult<Product> result = productDAOImplement.fetchAllProductsPaginatorResult( 1, 12, 4 );
//        List<Integer> navBar = result.getNavigateBar();
//        List<Product> list1 = result.getList();
//        System.out.println( navBar );
//        for ( Product product : list1 ) {
//            System.out.println( product );
//        }
//
//        System.out.println("\n\n\n---------------Test Paginator search---------------------------");
//        PaginatorResult<Product> result2 = productDAOImplement.findAllProductMatchNamePatternPaginatorResult( 1, 12, 4, "hung" );
//        if ( result2 != null ) {
//            List<Integer> navBar2 = result2.getNavigateBar();
//            List<Product> list2 = result2.getList();
//            System.out.println( navBar2 );
//            for ( Product product : list2 ) {
//                System.out.println( product );
//            }
//        }
//
//        System.out.println("\n\n\n---------------Test search product---------------------------");
//        Product productcode = productDAOImplement.fetchProduct("S20");
//        System.out.println( productcode );
//
//        System.out.println("\n\n\n---------------Test save product---------------------------");
////        Generate auto data
//        String desc1 = "Dòng họ của bạc hà có nhiều loại, nhưng loại chocolate này có mùi thơm nhất (mùi bạc hà pha lẫn chocolate). Mình thử vuốt nhẹ lá bạc hà này rồi đưa tay lên mũi ngửi ngửi, mùi thơm mát lạnh dễ chịu lắm.\n" +
//                "Cây này dễ trồng, có thể để trên bàn làm việc, cách ngày đem ra nắng một chút cho cây xanh tốt. Lá già thì ngắt lá ăn rồi cây lại mọc nhánh mới." +
//                "<br>Công dụng:\n" +
//                "1. Trị viêm họng, ho: khi có dấu hiệu viêm họng, mỗi buổi sáng ngắt 3 lá nhai, sau 3 ngày sẽ hết. Còn giúp cho hơi thở thơm tho.\n" +
//                "2. Pha trà: bỏ vài lá tươi vào ly rồi chế nước sôi vào, để dành uống trong ngày (giúp tiêu hóa tốt)\n" +
//                "3. Làm bánh, làm kem bạc hà, sinh tố,...: các loại bánh có mùi chocolate đều hợp với mùi của lá bạc hà này\n" +
//                "4.Ngoài ra, còn nhiều công dụng khác cho sức khỏe: mùi thơm của bạc hà giúp thần kinh tỉnh táo, tăng cường trí nhớ, dưỡng da và trị mun, phòng và trị bệnh ung thư,...";
//        String desc2 = "Cây cỏ ngọt còn được gọi là cây cỏ đường cây cúc ngọt hay cây cỏ mật, cây thay thế đường. Cây cỏ ngọt có tên khoa học là Stevia rebaudiana Bertoni thuộc chi Stevia họ Cúc Asteraceae.\n" +
//                "Đặc điểm: là một loại cỏ sống lâu năm, 6 tháng sau khi trồng; gốc bắt đầu hoá gỗ, mỗi gốc có nhiều cành (nếu để mọc tự nhiên cây có thể cao đến 100cm). Cành non và lá đều phủ lông trắng mịn, lá mọc đối, hình mũi mác, dài 30-60mm, rộng 15-30mm, có 3 gân chính xuất phát từ cuống lá. Mép lá có răng cưa ở nửa phần trên. Cụm hoa hình đầu, mỗi tổng bao có chứa 5 hoa nhỏ, tràng hình ống, màu trắng ngà, có 5 cánh nhỏ. Hoa dài 10-12mm. Có hai vòi nhuỵ dài thò ra ngoài. Hoa có mùi thơm nhẹ (hình dáng giống hoa cỏ Lào, nhưng nhỏ hơn nhiều). Mùa hoa từ tháng 10 năm trước đến tháng 2 năm sau (theo dương lịch).\n" +
//                "\n" +
//                "Cây cỏ ngọt và các chiết xuất của nó đã được sử dụng nhiều trong y học và công nghiệp đặc biệt cây cỏ ngọt có tác dụng rất tốt đối với những người bị tiểu đường.";
//        String desc3 = "Húng cây (Bạc hà nam) là cây thân thảo hàng năm, ưa ẩm độ cao.\n" +
//                "\n" +
//                "Có thân rễ mọc ngầm dưới đất, trên thân có nhiều chồi mầm và rễ mầm ở các đốt nên thường được trồng bằng cách vô tính.\n" +
//                "\n" +
//                "Húng cây ưa đất tốt, đủ ẩm , phát triển kém ở đất bị đọng nước lâu ngày.\n" +
//                "\n" +
//                "Húng cây là một bài thuốc khá hữu hiệu trong việc chữa trị cảm cúm và các vết côn trùng cắn, giúp lợi tiêu hóa, chữa chứng đầy hơi, thấp khớp, nấc cục, thông cổ, trị viêm xoang nhẹ.";
//        String desc4 = "Tần dày lá còn gọi là Húng chanh, Rau tần, Tần dày lá, Rau thơm lông, Dương tô tử, Sak đam ray - Plectranthus amboinicus (Lour.) Spreng (Coleus amboinicus Lour.), thuộc họ Hoa môi - Lamiaceae.\n" +
//                "Cây thảo có thể sống nhiều năm, cao 20-50cm, phần thân sát gốc hoá gỗ. Lá mọc đối dày mọng nước, hình trái xoan rộng, dài 3-6cm, rộng, mọc thành bông ở ngọn thân và đầu cành, gồm những vòng hoa dày đặc, cách quãng nhau. Quả nhỏ, tròn, màu nâu, chứa 1 hạt. Toàn cây có lông rất nhỏ và có mùi thơm như mùi chanh.\n" +
//                "Húng chanh có vị the cay, hơi chua, mùi thơm, tính ấm, không độc, có tác dụng lợi phế, trừ đờm, giải cảm, làm ra mồ hôi, làm thông hơi, giải độc. Colein trong lá có tác dụng kháng sinh mạnh đối với một số vi trùng, nhất là ở vùng họng, mũi, miệng và cả ở đường ruột.\n" +
//                "\n" +
//                "Công dụng, chỉ định và phối hợp: Nhân dân ta thường thái nhỏ lá Húng chanh để ướp thịt, cá, nó là loại gia vị đặc sắc. Lá và ngọn non thường được dùng trị Cảm cúm, ho hen, ho ra máu, sốt cao, sốt không ra mồ hôi, nôn ra máu, đổ máu cam, còn dùng chữa viêm họng, khản tiếng. Liều dùng 10-15g, dạng thuốc sắc hoặc giã lấy nước uống. Có thể dùng riêng hoặc phối hợp với nhiều loại lá khác nấu nước xông.\n" +
//                "\n" +
//                "Ở Malaixia, người ta dùng lá nấu cho phụ nữ sau khi sinh đẻ nóng, lá tươi giã ra lấy nước cốt cho trẻ em bị sổ mũi uống. Dùng ngoài lấy lá giã ra đắp trị nẻ môi, đau bụng, đau đầu và dùng xoa lên người khi bị sốt.\n" +
//                "\n" +
//                "Ở Ấn Độ, lá Húng chanh dùng chữa bệnh về đường tiết niệu và rỉ nước âm đạo. Nước ép lá trộn với đường là một loại thuốc gây trung tiện mạnh, cũng dùng trị ho và chứng khó tiêu.";
//        String desc5 = "Rau húng quế được biết đến là một loại rau thơm được dùng ăn kèm với nhiều món ăn. Rau húng quế cũng được biết đến với nhiều tác dụng chữa một số loại bệnh thông thường.\n" +
//                "\n" +
//                "Húng quế là cây rau xanh, lá nhỏ, cành tím, hoa trắng. Theo Đông y, húng quế có vị cay, tính nóng, làm ra mồ hôi, lợi tiểu, giảm đau. Quả húng quế có vị ngọt và cay, tính mát, tốt cho thị lực. Lá húng chó rất thơm, đem nhaisống làm thơm tho răng miệng. Mùi hương này còn tạo cảm giác hưng phấn, xua tan mệt mỏi và nâng cao hammuốn tình dục. Hơn nữa, lấy húng quế cho lên bếp để mùi hương lan tỏa khắp nhà còn xua đuổi được côn trùng rất công hiệu.\n" +
//                "\n" +
//                "Như các loại rau thơm ăn sống khác, húng quế không chỉ có hương vị thơm ngon mà nó còn giúp thức ăn dễtiêu, chống đầy hơi, buồn nôn hay co thắt dạ dày. Dân gian truyền rằng, lúc thấy đầy bụng, khó tiêu, chỉ cầnngâm húng quế vào nước nóng mà uống là sẽ thấy ấm bụng, dễ chịu.\n" +
//                "\n" +
//                "Húng quế chứa rất nhiều tinh dầu. Trong tinh dầu này có chất chống oxy hóa mạnh có thể ngăn ngừa lão hóa vàphòng chống ung thư. Ngoài ra, tinh dầu còn chứa nhiều vitamin và chất khoáng, nhất là ma-nhê (Mg), rất tốt cho cơ bắp và tim mạch. Khả năng dưỡng da, làm đẹp của dầu húng quế càng không phải bàn cãi vì chữa trị mụntrứng cá và bệnh vảy nến rất tốt.\n" +
//                "\n";
//        String desc6 = "Hương thảo tỏa mùi hương nồng. Bộ phận sử dụng được của hương thảo là ngọn cây với lá. Khi thu hoạch ở quy mô lớn, người ta có thể cắt các ngọn cây có hoa đem phơi hay sấy khô, đập lấy lá. Cũng có thể cắt các cành tươi không hoa hoặc tỉa lá để dùng ở quy mô nhỏ. Hương thảo dùng để trang trí, cải thiện sức khỏe, nấu ăn, ngăn muỗi, đặc biệt hương thảo còn giúp loại bỏ căng thẳng, tăng cường trí nhớ, giúp tinh thần sảng khoái, tinh dầu của cây kích thích phát triển trí não của con người, giúp con người làm việc tốt hơn, trẻ hoạt bát hơn, học tốt hơn và nhanh thuộc bài hơn.\n" +
//                "\n" +
//                "Ẩm thực\n" +
//                "\n" +
//                "Lá tươi hay lá khô đều được dùng làm gia vị trong ẩm thực. Cành cây được sử dụng làm que xiên trong các món nướng BBQ, lá được gia vào các món nướng, áp chảo như bít tết, đặc biệt thích hợp khi khử mùi các loại thịt đỏ như thịt cừu, thịt bò thậm chí các loại thịt rừng có mùi như thịt nai, heo mọi. Các món thuần Âu như cừu nướng áp chảo, đút lò, nướng nguyên tảng, đến cừu hầm đều có thể sử dụng hương thảo. Các loại thịt trắng như thịt lợn, thịt gà, các loại rau củ quả như khoai tây, cà rốt cũng có thể sử dụng hương thảo cho ra các món rất thơm ngon. Ở Việt Nam, hương thảo còn dùng cho món luộc, sốt, nấu, hấp." +
//                "<br>";
//        String desc7 = "Thân cây lá giang là loại dây leo dài 1,5 – 4 m, nhẵn, có ít nhựa mủ trắng. Thân bò trên cây sống, cây chết hoặc thảm thực vật xanh. Rễ có nhiều cấp mọc sâu trên đất ẩm.\n" +
//                "Lá giang nấu canh chua với thịt cá, ăn mát ngon bổ ngoài ra còn làm thuốc trị bệnh, bộ phận dùng làm thuốc là thân, rễ và lá. Cây lá giang là cây thuốc dân gian, dùng chữa chứng ăn uống không tiêu, bụng đầy trướng, đau dạ dày, đau nhức xương khớp. Cây lá giang dùng ngoài chữa mụn nhọt, lở ngứa ngoài da; dùng làm thực phẩm có vị chua khi chế biến các món ăn (cá, thịt). Thân lá giang làm thuốc chữa sỏi tiết niệu, viêm đường tiết niệu, viêm thận mạn tính. Đặc biệt, lá giang còn có tác dụng chữa viêm ruột, phong thấp, sưng tấy…\n" +
//                "<br>";
//        String desc8 = "Công dụng:\n" +
//                "\n" +
//                "Ngò om (rau ngổ) tía là loại thân màu tím được dân gian dùng như rau thuốc, có dược tính hơn loại thân trắng.\n" +
//                "\n" +
//                "Người ta trồng rau ngổ lấy cành lá non thơm để nấu canh chua, cũng có thẻ ăn sống làm gia vị. Cây được dùng làm thuốc chữa cảm sốt, cầm máu băng huyết, thổ huyết, hạt dùng trị bệnh về gan mật và thần kinh. Lá nghiền đắp vào da trị phát ban, mụn rộp. Liều dùng 12-20g dạng thuốc sắc dùng ngoài không kể liều lượng. \n" +
//                "\n" +
//                "Từ xa xưa, người Việt đã biết sử dụng rau ngổ, rửa sạch, phơi khô, làm thuốc để chữa sạn thận, làm thuốc lợi tiểu, chống co thắt, giãn cơ… Nhiều nghiên cứu tại Việt Nam cho thấy, kết quả đáng ngạc nhiên về tác dụng của rau ngổ. Hoạt chất trong rau ngổ có thể làm giãn mạch, tăng tốc độ lọc cầu thận giúp tăng lượng nước tiểu. Quá trình này giúp bào mòn sỏi thận, thậm chí bệnh nhân có tiểu ra những viên sỏi nhỏ.\n" +
//                "\n" +
//                "Không chỉ có vậy, y học cổ truyền Ấn Độ (kinh Vệ đà) còn nói rằng, rau ngổ có tác dụng thông mật, kích thích tiêu hóa, chữa khỏi băng huyết, tăng tiết sữa cho phụ nữ sau sinh, làm giảm các triệu chứng chán ăn, khó tiêu… Với các bệnh ngoài da như nấm, ngứa, hắc lào… rau ngổ có thể hỗ trợ điều trị bằng cách dùng cây tươi giã nhuyễn và đắp lên da, kết hợp với sắc nước uống sau một thời gian sẽ khỏi." +
//                "<br>";
//        String desc9 = "Giá trị dinh dưỡng\n" +
//                "\n" +
//                "Lá oregano chứa khoảng 4% dầu thiết yếu, carvacloro, chất béo, protein, khoáng chất (canxi, sắt, magiê, natri, kẽm, kali), vitamin như thiamine, carbohydrates.\n" +
//                "\n" +
//                "Tác dụng\n" +
//                "\n" +
//                "Lá oregano có thể áp dụng vào thuốc giảm đau, sát trùng, giảm đau, chống co thắt, đờm, thuốc dễ tiêu và thuốc bổ, hỗ trợ tiêu hóa, làm giảm đầy hơi và chuột rút ruột, và nó cũng là một thuốc an thần tuyệt vời cho ho với tính chất đờm.\n" +
//                "\n" +
//                "Cách dùng\n" +
//                "\n" +
//                "Lá oregano có thể dùng được cả khô lẫn tươi: Loại khô cũng thơm, dùng ổn trong các món nướng/đút lò. Còn các món nguội hoặc ít nhiệt thì phải dùng loại tươi, có thể ăn sống.\n" +
//                "\n" +
//                "Dùng trong hỗ trợ các triệu chứng như kích thích hệ tiêu hóa, đầy hơi, tiêu hóa kém, giảm nhức đầu và cảm lạnh. Súc miệng trong các trường hợp bị viêm họng. Trong mỹ phẩm, lá oregano được sử dụng để tắm làm sạch kích thích và chất khử trùng: Bằng cách ngâm trong bồn tắm trong một chiếc túi cùng với một ít lá oregano. Tinh dầu của nó được sử dụng rộng rãi trong dầu thơm và nước hoa." +
//                "";
//        String desc10 = "Mô tả: Cây thảo có gốc bò, với những thân bò dưới đất có vẩy và những chồi bò trên mặt đất có lá thường phân nhánh, có thể dài tới 1m. Lá có cuống, hình trái xoan hay thuôn, tù hay nhọn, có răng nhiều hay ít, nhẵn hay có lông, nhăn nheo nhiều hay ít. Hoa thành vòng có cuống, đài to, tràng có lông ở trong ống; 4 nhị dài bằng nhau, vòi chẻ đôi ở ngọn. Quả bế có mụt mịn.\n" +
//                "\n" +
//                "Công dụng, chỉ định và phối hợp: Ta thường trồng trong các vườn làm rau gia vị ăn với thịt nướng, ăn gỏi, ăn với các loại rau sống khác, là gia vị được ưa chuộng. Dùng hãm uống làm thuốc lợi tiêu hoá. Cũng dùng ngoài giã đắp làm thuốc sát trùng, chữa vết thương chữa sưng vú.\n" +
//                "\n";
//        String desc11 = "Kim ngân là một loại dây mọc leo, thân có thể vươn dài tới 10m hay hơn. Cành lúc còn non màu lục nhạt, có phủ lông mịn, khi cành già chuyển màu nâu đỏ nhạt, nhẵn. Lá mọc đối, đôi khi mọc vòng 3 lá một, hình trứng dài, đầu hơi tù, phía cuống tròn, cuống ngắn 2-3mm, cả hai mặt đều phủ lông mịn. Vào các tháng 5-8, hoa mọc từng đôi ở kẽ lá, mỗi kẽ lá có 1 cuống mang 2 hoa, hai bên lá mọc đối mang 4 hoa, lá bấc giống lá nhưng nhỏ hơn. Hoa hình ống xẻ hai môi, môi lớn lại xẻ thành 3 hay 4 thùy nhỏ, phiến của tràng dài gần bằng ống tràng, lúc đầu màu trắng, sau khi nở một thời gian chuyển màu vàng, cùng một lúc trên cây có hoa mới nở màu trắng như bạc, lại có hoa nở đã lâu màu vàng như vàng cho nên có tên là kim ngân (kim là vàng, ngân là bạc); cây kim ngân xanh tốt vào mùa đông cho nên còn có tên là nhẫn đông nghĩa là chịu đựng mùa đông, 4 nhị thòi dài cao hơn tràng; vòi nhụy lại thòi dài cao hơn nhị, mùi thơm dễ chịu. Quả hình trứng dài chừng 5 mm." +
//                "";
//        String desc12 = "Cây Tha La hay còn gọi là cây Đầu Lân, Hàm Rồng, cây Sala… Cây có nguồn gốc từ Nam Mỹ.\n" +
//                "Cây Tha La là loài cây rất dễ sống, thích nghi với môi trường rất tốt, thích hợp với nhiều loại đất khác nhau như: đất nhiễm phèn, đất thịt, đất pha cát, đất úng nước…\n" +
//                "\n" +
//                "Cây Tha La là cây thân gỗ lớn, thân thẳng, tán rộng, lá dày, cây có thể cao 20m đến 30m.\n" +
//                "Hoa Tha La ra từ thân cây, suốt từ gốc lên, chùm hoa dài ra liên tục có thể tới 2-3m. Hoa có màu cam lẫn đỏ thắm và hồng, và mọc thành chùm trên cọng dài có khi tới 3m. Hoa Tha La trổ hoa quanh năm tạo ra vẻ đẹp thẩm mỹ, giúp tâm hồn con người thư thái, bình an.\n" +
//                "\n" +
//                "Ngoài ra, trồng cây Tha La giúp ta có được dược liệu từ quả, từ đó bào chế ra thuốc kháng sinh, kháng nấm, sát khuẩn và có tác dụng giảm đau. Nước uống làm từ các lá được sử dụng để chữa bệnh da.\n" +
//                "\n" +
//                "Cây Tha La là loài cây mang ý nghĩa thiêng liêng đối với Phật giáo, là nơi Đức Phật sinh ra. Vì thế ngày nay, ngoài cây bồ-đề, cây Tha La cũng được trồng tại các khuôn viên của các chùa." +
//                "";
//        String desc13 = "- Thuộc loại cây thân gỗ nhỏ, có gai, có xu hướng mọc cao hơn so với các giống hồng bụi khác nên có khả năng leo.\n" +
//                "\n" +
//                "- Hoa màu hồng có mùi thơm, mới nở sẽ có màu hồng, đến khi sắp tàn sẽ nhạt đi. Cây trưởng thành hoa sẽ nở thành từng chùm, mỗi chùm 3-12 hoa, tùy vào điều kiện chăm sóc của cây.\n" +
//                "\n" +
//                "- Sinh trưởng nhanh, không kén khí hậu như các giống hồng khác.\n" +
//                "\n" +
//                "Cách trồng hồng Tường Vy:\n" +
//                "- Giống Hồng vốn ưa nắng nên chọn những vị trí nắng ổn định. Khi cây đầy đủ nắng thì bông mới to và đẹp.\n" +
//                "- Hồng Tường Vy sau khi ra bông thì nên cắt cành để cây đâm chồi mới.";
//        String desc14 = "Cây hồng bụi cao to, hoa to, sai hoa quanh năm\n" +
//                "Giống ngoại nhập đã được thuần cho thích nghi khí hậu VN, rất dễ chăm sóc tại nhà";
//        String desc15 = "Cây hoa hồng đổi màu là loài cây ưa nắng, nhưng phải chú ý tưới đủ nước. Có thể trồng ở sân vườn hoặc trồng chậu thì chọn loại thoát nước tốt tránh cây bị ngập úng.\n" +
//                "Sau khi hoa tàn, cắt hoa xuống 2 tầng lá để cây ra chồi và hoa mới. Định kỳ 10 ngày cung cấp dinh dưỡng dành cho hoa hồng 2 trong 1 (vừa cho hoa đẹp vừa phòng bệnh cho hoa)\n" +
//                "\n" +
//                "Mỗi ngày quan sát hoa bạn sẽ cảm thấy rất thú vị vì sự đổi màu hoa này, buổi sáng hoa vàng vàng, đến trưa đã chuyển sang cam vàng, hôm sau thì màu đỏ hồng,... khi hoa gần tàn thì chỉ còn màu trắng. Và cũng tùy cách chăm sóc, chất đất và khí hậu từng vùng mà Hoa có màu sắc khác nhau." +
//                "";
//        String desc16 = "CÁCH CHẾ BIẾN (trích nguồn ngocdiepsite)\n" +
//                "\n" +
//                "CÁCH HẤP :\n" +
//                "\n" +
//                "Rửa sạch lá ,cắt khúc chiều dài khoảng 2 lóng tay là dể ăn nhất ,sau khi cắt để KALE 5 phút sau mới hấp khoảng 4,5 phút là chín ,đừng làm chín quá chất bổ bị tiêu trừ thất thoát 1 ít, do đó 4 hay 5 phút hấp hoặc cho vào microwave 2, 3 phút là đủ ,ăn với chút xì dầu maggie và 1 chút nước cốt chanh, mình thì ăn không chắm gì cả ăn không mà thôi.\n" +
//                "\n" +
//                "CÁCH XÀO :\n" +
//                "\n" +
//                "Có thể cho vào cuối cùng khi xào với các loại rau cải khác ,đảo đều là tắt lửa múc ra ngay không cho quá chín cũng làm mất chất bổ.\n" +
//                "\n" +
//                "XÀO VỚI TỎI:\n" +
//                "\n" +
//                "Cũng như xào với các loại rau khác cho dầu veg đập ít lát tỏi ,phi cho thơm và cho KALE vào đảo qua đảo lại múc ra dĩa ngay ,nếu muốn nêm tí nước mắm ,xì dầu gì thì phải lẹ tay không thôi KALE chín quá,thêm tiêu ớt sau khi cho ra dĩa dùng với cơm hay ăn không cũng rất tốt.\n" +
//                "\n" +
//                "TRỘN XÀ LÁCH :\n" +
//                "\n" +
//                "Có thể trộn chung với các loại rau hoặc xà lách với chút ít nước chanh ,dầu ,tiêu tỏi ,muối hoặc xì dầu hay nước trộn người ta bán sẳn nhưng không trộn với những loại quá béo\n" +
//                "\n" +
//                "Mình ăn loại rau nầy cho giảm lượng mở ,tăng hồng huyết cầu và các loại sinh tố chất xanh cần thiết ,giúp cân bằng bao tử ,đường ruột nên cũng không nên ăn quá nhiều ,cũng sẽ giảm cân, giúp đường ruột thải những chất không cần thiết và tốt cho màng bao tử đó.Ngủ ngon, bớt sưng nhức tay chân ,hạ mở tim mạch sẽ nhẹ nhàng hơn ,hợp với đi bộ 1/2 giờ mổi ngày sẽ giúp chúng ta ngày mổi khỏe mạnh hơn .\n" +
//                "\n";
//        String desc17 = "Rau ngót Nhật có tên khoa học là Dicliptero chinensis (L.) Ness, thuộc họ ô rô – Acanthaceae. ở Việt Nam thường gọi là rau Bồ ngót Nhật, hoặc cây rau Diễn, cây Gan heo.\n" +
//                "\n" +
//                "Rau Bồ ngót Nhật là cây rất dễ sống, có thể nhân giống bằng cách giâm cành, nhanh ra rễ. Cây sinh trưởng mạnh, ra lá liên tục, có thể thu hoạch làm rau thường xuyên. Cây có thể trồng vào các chậu lớn, trồng nhiều cành, ra nhiều nhánh, lan rộng trên mặt chậu.\n" +
//                "\n" +
//                "Ngoài ra với hàm lượng dinh dưỡng cao, nhiều DHA, canxi,đạm, và sắt, rau ngót Nhật thường được các bà mẹ dùng để nấu với tôm khô, cua đồng hoặc xay nấu cháo cho trẻ em. Món cháo này thường rất hợp cho các bé đang bị táo bón và đầy hơi. Rau ngót Nhật mềm hơn rau ngót ta, lại có vị ngọt nên khá dễ ăn chắc chắn sẽ làm bé hài lòng." +
//                "";
//        String desc18 = "- Rau ngót thuộc dạng cây bụi, có thể cao đến 2 m, phần thân khi già cứng chuyển màu nâu. Lá cây rau ngót hình bầu dục, mọc so le; sắc lá màu lục thẫm. Khi hái ăn, thường chọn lá non." +
//                "";
//        String desc19 = "Công dụng của cây bồ công anh:\n" +
//                "Tiêu diệt các tế bào ung thư. Trà bồ công anh tiêu diệt tế bào ung thư bằng cách làm cho các tế bào này tự hủy trong vòng 48 giờ. Các nhà khoa học đã phát hiện ra rằng sử dụng rễ cây bồ công anh còn tốt hơn việc hóa trị bởi chúng chỉ tiêu diệt các tế bào bị ung thư mà thôi.Các nghiên cứu bước đầu phòng hóa học và hóa sinh học thuộc  Đại học Windsor, Canada đã đưa ra hy vọng mới cho các bệnh nhân ung thư. Kết quả cho thấy rễ cây bồ công anh đã tiêu diệt các tế bào ung thư mà không làm tổn hại đến các tế bào khỏe mạnh trong cơ thể.\n" +
//                "\n" +
//                "Giải độc gan. Trà rễ cây bồ công anh đã được sử dụng làm thuốc tại Châu Mỹ và Trung Quốc hàng trăm năm qua. Tiến sỹ OZ, mặc dù đã ra nước ngoài song ông vẫn sử dụng trà bồ công anh để giúp giải độc cho gan khi ngủ, ông gọi quá trình này là :làm sạch trong 48 giờ. Rễ cây bồ công anh từ lâu đã được biết đến như một phương thuốc dân gian để giúp bổ gan. Nghiên cứu ban đầu cho thấy trà bồ công anh kích thích sự hoạt động của mật.Trong quá trình tìm hiểu trà bồ công anh tác dụng lên gan như thế nào thì người ta đã phát hiện ra nó có tác dụng hỗ trợ giải độc gan, giúp giải quyết các vấn đề về da và mắt, giảm khả năng mắc bệnh về gan.\n" +
//                "\n" +
//                "Phòng chống viêm nhiễm đường tiết niệu. Trà bồ công anh có thể giúp ngăn ngừa viêm nhiễm đường tiết niệu cũng như rối loạn đường tiết niệu, các vấn đề về thận và còn có khẳ năng ngăn ngừa u nang của cơ quan sinh sản.\n" +
//                "Một loại trà đặc biệt bao gồm chiết xuất từ rễ và lá bồ công anh (theo một tỷ lệ nhất định) kết hợp với một vài thảo mộc khác gọi là “ uva ursi – cây thường xanh dây leo” sẽ có tác dụng lớn giúp giảm viêm nhiễm ở phụ nữ. Trong hỗn hợp trà thảo mộc trên thì cây thường xanh dây leo có tác dụng diệt khuẩn, còn bồ công anh có tác dụng lợi tiểu và chống nhiễm trùng\n" +
//                "\n";
//        String desc20 = "Chè vằng là một cây nhỏ, mọc thành bụi ở bờ rào hay bụi tre hoặc bám vào các cây lớn. Thân cây cứng chia thành từng đốt, đường kính 5-6 mm, chia thành nhiều cành, có thể vươn cao 1-1,5 m và vươn dài tới 15-20 m, thân và cành đều nhẵn. Lá mọc đối, hình mũi mác, phía cuống tù hay hơi tròn, đầu lá nhọn, những lá phía trên nhỏ hơn lá phía dưới. Hoa mọc thành xim nhiều hoa (chừng 7-9 hoa), cánh hoa màu trắng.\n" +
//                "\n" +
//                " \n" +
//                "\n" +
//                "Nhân dân nhiều tỉnh dùng lá vằng phơi khô nấu hay pha nước uống hàng ngày hay cho phụ nữ sau khi sinh uống. Có nơi dùng lá nấu nước tắm cho trẻ con bị ghẻ lở. Tại miền Nam, nhân dân dùng lá chữa sưng vú, cho phụ nữ mới sinh uống, còn dùng chữa rắn cắn, rễ mài với giấm thanh để làm hết mủ những ung nhọt đã nung mủ. Liều uống hàng ngày: 20-30 g lá khô. Dùng ngoài không kể liều lượng.\n" +
//                "\n" +
//                "Kinh nghiệm dùng lá chè vằng của bệnh viện Thái Bình: Dùng lá chè vằng giã nát đắp vào nơi áp xe vú hoặc giã lá với cồn 50 độ rồi đắp vào nơi áp xe. Ngày 3 lần, đêm 2 lần. Thời gian điều trị thường là 1 ngày đến 1 tuần tùy theo bệnh nặng hay nhẹ và được bắt đầu chữa bằng lá chè vằng sớm hay muộn, trung bình 1,5 đến 2 ngày. Bệnh nhân điều trị bằng chè vằng thường hết sốt sau 2 giờ dùng thuốc, sau khi khỏi bệnh, công thức và số lượng bạch cầu trở lại bình thường, sữa cũng trở lại bình thường.\n" +
//                "\n" +
//                "GS Đỗ Tất Lợi, Sức Khỏe & Đời Sống";
//        String fakename1 = "Cay co ngot Stevia";
//        String fakename2 = "Cay hung cay";
//        String fakename3 = "Cay hung chanh";
//        String fakename4 = "Cay hung que";
//        String fakename5 = "Cay huong thao";
//        String fakename6 = "Cay la giang";
//        String fakename7 = "Cay ngo om tia";
//        String fakename8 = "Cay oregano";
//        String fakename9 = "Cay rau hung lui";
//        String fakename10 = "Cay kim ngan hoa";
//        String fakename11 = "Cay tha la ( Sala )";
//        String fakename12 = "Cay hong leo tuong vi";
//        String fakename13 = "Cay hong tim shocking blue";
//        String fakename14 = "Cay hong doi mau";
//        String fakename15 = "Cay bo cong anh";
//        String fakename16 = "Cay che vang";
//        String fakename17 = "Qua kiwi";
//        String fakename18 = "Qua na";
//        String fakename19 = "Qua buoi da xanh";
//        String fakename20 = "Qua hong xiem";
//
//        List<String> listFakeDesc = new ArrayList<>();
//        List<String> listFakeName = new ArrayList<>();
////        Fake Desc product
//        listFakeDesc.add( desc1 );
//        listFakeDesc.add( desc2 );
//        listFakeDesc.add( desc3 );
//        listFakeDesc.add( desc4 );
//        listFakeDesc.add( desc5 );
//        listFakeDesc.add( desc6 );
//        listFakeDesc.add( desc7 );
//        listFakeDesc.add( desc8 );
//        listFakeDesc.add( desc9 );
//        listFakeDesc.add( desc10 );
//        listFakeDesc.add( desc11 );
//        listFakeDesc.add( desc12 );
//        listFakeDesc.add( desc13 );
//        listFakeDesc.add( desc14 );
//        listFakeDesc.add( desc15 );
//        listFakeDesc.add( desc16 );
//        listFakeDesc.add( desc17 );
//        listFakeDesc.add( desc18 );
//        listFakeDesc.add( desc19 );
//        listFakeDesc.add( desc20 );
////        Fake name
//        listFakeName.add( fakename1 );
//        listFakeName.add( fakename2 );
//        listFakeName.add( fakename3 );
//        listFakeName.add( fakename4 );
//        listFakeName.add( fakename5 );
//        listFakeName.add( fakename6 );
//        listFakeName.add( fakename7 );
//        listFakeName.add( fakename8 );
//        listFakeName.add( fakename9 );
//        listFakeName.add( fakename10 );
//        listFakeName.add( fakename11 );
//        listFakeName.add( fakename12 );
//        listFakeName.add( fakename13 );
//        listFakeName.add( fakename14 );
//        listFakeName.add( fakename15 );
//        listFakeName.add( fakename16 );
//        listFakeName.add( fakename17 );
//        listFakeName.add( fakename18 );
//        listFakeName.add( fakename19 );
//        listFakeName.add( fakename20 );
//
//        int qtyProduct = 10;
//        for ( int i = 0; i < qtyProduct; i++ ) {
//            Product product = new Product();
//            product.setTimestamp( new Timestamp( System.currentTimeMillis() ));
//            product.setCode( UUID.randomUUID().toString());
//            product.setDescription( listFakeDesc.get( random.nextInt( listFakeDesc.size() ) ) );
//            product.setName( listFakeName.get( random.nextInt( listFakeName.size() ) ) );
//            product.setCreatedDate( new Date());
//            product.setPriceTag( (double)( 100000 + random.nextInt( 3000000 ) ) );
//            productDAOImplement.saveProduct( product );
//        }
//
//        System.out.println("\n\n\n******Account DAO");
//        AccountDAOImplement accountDAOImplement = new AccountDAOImplement( driverManagerDataSource );
//
//        System.out.println("\n\n\n---------------Test fetch account---------------------------");
//        Account account = accountDAOImplement.fetchAccount("hungbui");
//        System.out.println( "Account : " + account );
//
//        System.out.println("\n\n\n---------------Test create account---------------------------");
//        Account accountForm = new Account();
//        accountForm.setEmail("buiduchung.bkhn@testing.com");
//        accountForm.setName("bui duc hung dep trai");
//        accountForm.setPhone("+8412345678");
//        accountForm.setAddress("92c/1, ngo 1194 duong Lang, quan Dong Da");
//        accountForm.setActive( true );
//        accountForm.setUsername("hungbui");
//        accountForm.setPassword("1234");
//        accountForm.setUserRole("USER");
//        accountDAOImplement.createAccount( accountForm );
//
//        System.out.println("\n\n\n******Order DAO");
//        OrderDAOImplement orderDAOImplement = new OrderDAOImplement( driverManagerDataSource );
//
//        System.out.println("\n\n\n---------------Test ordernumber---------------------------");
//        int orderNumber = orderDAOImplement.getMaxOrderNumber();
//        System.out.println("Order number :" + orderNumber);
//
//        System.out.println("\n\n\n---------------Test order_detail list---------------------------");
//        List<OrderDetail> listOrderDetail = orderDAOImplement.getOrder("id3").getOrderDetails();
//        if ( listOrderDetail != null ) {
//            for ( OrderDetail detail : listOrderDetail ) {
//                System.out.println( detail );
//            }
//        }
//
//        System.out.println("\n\n\n---------------Test order nav---------------------------");
//        PaginatorResult<Order> listOrderPage = orderDAOImplement.listOrderPaginatorResult( 1, 3, 3 );
//        System.out.println( listOrderPage.getNavigateBar() );
//        List<Order> listOrderPageList = listOrderPage.getList();
//        for ( Order order : listOrderPageList )
//            System.out.println( order );
//
//        System.out.println("\n\n\n---------------Test order list---------------------------");
//        List<Order> showAll = orderDAOImplement.listOrder();
//        System.out.println( showAll );
//
//        System.out.println("\n\n\n---------------Test Cart function---------------------------");
//        Cart cart = new Cart();
//        System.out.println( "Info : "+ cart );
//        Account accountFromDB = accountDAOImplement.fetchAccount("manager1");
//
//        Customer customer = new Customer();
//        customer.setAddress("92c/1, ngo 1194");
//        customer.setEmail("test@test.com");
//        customer.setName("bui duc hung");
//        customer.setPhone("+842312312");
//        cart.setCustomer( accountFromDB );
//        System.out.println( cart );
//        Product productFromDB = productDAOImplement.fetchProduct("S5");
////        cart.addProduct( product, 2 );
////        cart.addProduct( product, 1 );
////        cart.addProduct( product, 5 );
//        cart.addProduct( productFromDB, 14 );
//        System.out.println( cart );
//        System.out.println( "Find in cart : " + cart.findCartEntryProductByCode("S24") );
//        System.out.println( "Amount :" + cart.getAmountTotalInCart() );
//        System.out.println( cart.getCartEntriesProducts() );
//        Product product2 = productDAOImplement.fetchProduct("S19");
////        product2.setTimestamp( new Timestamp( System.currentTimeMillis() ));
////        product2.setCode("S12");
////        product2.setDescription("Dòng họ của bạc hà có nhiều loại, nhưng loại chocolate này có mùi thơm nhất (mùi bạc hà pha lẫn chocolate). Mình thử vuốt nhẹ lá bạc hà này rồi đưa tay lên mũi ngửi ngửi, mùi thơm mát lạnh dễ chịu lắm.\n" +
////                "Cây này dễ trồng, có thể để trên bàn làm việc, cách ngày đem ra nắng một chút cho cây xanh tốt. Lá già thì ngắt lá ăn rồi cây lại mọc nhánh mới.<br>" +
////                "Công dụng:\n" +
////                "1. Trị viêm họng, ho: khi có dấu hiệu viêm họng, mỗi buổi sáng ngắt 3 lá nhai, sau 3 ngày sẽ hết. Còn giúp cho hơi thở thơm tho.\n" +
////                "2. Pha trà: bỏ vài lá tươi vào ly rồi chế nước sôi vào, để dành uống trong ngày (giúp tiêu hóa tốt)\n" +
////                "3. Làm bánh, làm kem bạc hà, sinh tố,...: các loại bánh có mùi chocolate đều hợp với mùi của lá bạc hà này\n" +
////                "4.Ngoài ra, còn nhiều công dụng khác cho sức khỏe: mùi thơm của bạc hà giúp thần kinh tỉnh táo, tăng cường trí nhớ, dưỡng da và trị mun, phòng và trị bệnh ung thư,..." +
////                "<br>Order cây bạc hà chocolate tại web: www.rausachonline.vn\n" +
////                "0918 176 316.");
////        product2.setName("Cay chocolate");
////        product2.setCreatedDate( new Date());
////        product2.setPriceTag( 150000d );
//        cart.addProduct( product2, 16 );
//        System.out.println( cart );
//        System.out.println( "Amount :" + cart.getAmountTotalInCart() );
//        System.out.println( "Qty : " + cart.getQuantityTotalInCart() );
//        cart.updateProduct("S5", 8);
//        cart.addProduct( productDAOImplement.fetchProduct("S16"),12 );
//        System.out.println( "Info : " + cart );
//        System.out.println( "Amount :" + cart.getAmountTotalInCart() );
//        System.out.println( "Qty :" + cart.getQuantityTotalInCart() );
//
//        System.out.println("\n\n\n---------------Test Save order---------------------------");
//        orderDAOImplement.saveOrder( cart );
//        System.out.println( "Cart order_num :" + cart.getOrderNum() );
//        orderDAOImplement.saveOrder( cart );
//        System.out.println( "Cart order_num :" + cart.getOrderNum() );
//    }
//}
