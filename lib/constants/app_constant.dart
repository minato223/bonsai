import 'package:bonsai/constants/app_images.dart';
import 'package:bonsai/models/bonsai.dart';

class AppConstant {
  static List<Bonsai> get bonsaiCategories => [
        Bonsai(
            imagePath: AppImages.img1,
            name: "Kenshitsubo",
            description:
                "These are the smallest possible variety of bonsai tree. Little more than artfully-designed seedlings, they’re also known as poppy seed sized trees. Rarely are they ever more than one to three inches in height. They can be lifted with two fingers easily."),
        Bonsai(
            imagePath: AppImages.img2,
            name: "Shito",
            description:
                "These are the smallest common size of bonsai tree. Known as fingertip size, they grow generally between two and four inches in height. Often they can be found in pots no larger than a thimble, leading to their other name, the thimble bonsai."),
        Bonsai(
            imagePath: AppImages.img3,
            name: "Shohin",
            description:
                "These bonsai trees are in a category that overlaps others, leading to the disuse of the name. They grow between two and six inches in height. They’re also known as the palm bonsai, because of how they easily fit in a palm. Shohin and Shito are differentiated from other small bonsai trees by the techniques used to create them."),
        Bonsai(
            imagePath: AppImages.img4,
            name: "Mame",
            description:
                "These bonsai trees grow between four and eight inches in height. They are the smallest of the bonsai trees known as one handed trees, because it takes a single hand to move them. Often they have larger pots than Shohin bonsai trees."),
        Bonsai(
            imagePath: AppImages.img5,
            name: "Komono",
            description:
                "Also known as the generic small bonsai tree, the Komono bonsai grows on average between six and ten inches. They are almost the largest tree that can be moved with one hand."),
        Bonsai(
            imagePath: AppImages.img6,
            name: "Katade-Mochi",
            description:
                "The largest bonsai classification that can be lifted in one hand, the Katade-Mochi bonsai grows between ten and eighteen inches in height. These are some of the more common tree sizes to work with, because they are neither too small to prune nor too large to handle."),
        Bonsai(
            imagePath: AppImages.img7,
            name: "Chumono, Chiu",
            description:
                "These two bonsai tree sizes are virtually the same. They are both considered two handed bonsai trees, and they both grow between sixteen and thirty-six inches in height. The names are virtually interchangeable."),
      ];
  static List<Bonsai> get bonsaiList => [
        Bonsai(
            imagePath: AppImages.img8,
            name: "Omono",
            description:
                "These large bonsai trees are the first among the four hand category. They grow anywhere from thirty to forty-eight inches in height. They are differentiated from the Dai category in very minor ways, such that both are classified as Very Large in English."),
        Bonsai(
            imagePath: AppImages.img9,
            name: "Dai",
            description:
                "Again, these share the same size range and style as the Omono bonsai. The differences are likely only known to ancient Japanese bonsai masters."),
        Bonsai(
            imagePath: AppImages.img10,
            name: "Hachi-Uye",
            description:
                "These are among the largest bonsai trees. They are known as six hand trees because it takes as many as three people to move the tree in it’s pot. They grow between forty and sixty inches tall."),
        Bonsai(
            imagePath: AppImages.img11,
            name: "Imperial",
            description:
                "The Imperial bonsai is the largest and most majestic of all Bonsai trees. They grow between sixty and eighty inches tall and are found most often in the Japanese imperial gardens. They are also known as eight-handed due to the number of people required to move them."),
        Bonsai(
            imagePath: AppImages.img12,
            name: "Phyllostachys",
            description:
                "Phyllostachys belongs to the grass family and is a genus of Asian bamboo. It is mostly found across regions of China but has also has many species which have migrated to parts of Asia, America, Europe, Australia, etc. These trees."),
        Bonsai(
            imagePath: AppImages.img13,
            name: "Lantana camara",
            description:
                "The common Lantana, Lantana Camara, is a flowering plant indigenous to America’s tropics in the Verbenaceae family. It is often grown as an ornamental plant in a greenhouse or sunroom. Still, it may also perform well in a garden in colder regions if it has enough protection."),
        Bonsai(
            imagePath: AppImages.img14,
            name: "Kusamono",
            description:
                "In Japan, there is consistent and celebrated respect towards miniature plants that are placed in a household setting.This is one of the aspects that is a highlight over in Japan, who as a culture idealized, guided and showcased a passion towards the conservation and preservation of nature in the most mundane of activities."),
        Bonsai(
            imagePath: AppImages.img15,
            name: "Kokedama",
            description:
                "Having an English translation of ‘moss ball’, the Kokedama ain’t only intended for a poor man. It’s an all-around gardening technique suitable most for minimalistic spaces. It’s a beautiful way to diversify your bonsai experience!"),
      ];

  static List<String> get tabItemList => [
        "All",
        "Outdoors",
        "Indoors",
        "Garden",
      ];
}
