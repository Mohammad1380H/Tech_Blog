import 'package:tech_bloc/gen/assets.gen.dart';
import 'package:tech_bloc/models/data_model.dart';

import 'package:tech_bloc/models/tags_model.dart';

Map fakeData = {
  "imageAsset": Assets.images.programming,
  "title": "دوازده قدم برنامه نویسی یک دوره ی...",
  "writer": "ملیکا عزیزی",
  "view": "28",
  "date": "یک روز پیش"
};

List<TagsModel> choosenTagLists = [];

List<BlogsModel> blogList = [
  BlogsModel(
      id: 1,
      urlImage: Assets.images.artPic,
      title: "رازهای اساسینز کرید والهه",
      writer: "فاطمه امیری",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 2",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "23"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.salidity,
      title: " برنامه ریزی درسی و نقش آن در پیشرفت دانش‌آموز",
      writer: "ملیکا عزیزی",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 7",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "55"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.artPic,
      title: "خطر انقراض تفکر در برنامه نویسی!",
      writer: "فاطمه امیری",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 2",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "23"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.salidity,
      title: "برنامه ریزی",
      writer: "ملیکا عزیزی",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 7",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "55"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.artPic,
      title: "رازهای اساسینز کرید والهه",
      writer: "فاطمه امیری",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 2",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "23"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.salidity,
      title: "برنامه ریزی",
      writer: "ملیکا عزیزی",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 7",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "55"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.artPic,
      title: "رازهای اساسینز کرید والهه",
      writer: "فاطمه امیری",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 2",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "23"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.salidity,
      title: "برنامه ریزی",
      writer: "ملیکا عزیزی",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 7",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "55"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.artPic,
      title: "رازهای اساسینز کرید والهه",
      writer: "فاطمه امیری",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 2",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "23"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.salidity,
      title: "برنامه ریزی",
      writer: "ملیکا عزیزی",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 7",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "55"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.artPic,
      title: "رازهای اساسینز کرید والهه",
      writer: "فاطمه امیری",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 2",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "23"),
  BlogsModel(
      id: 1,
      urlImage: Assets.images.salidity,
      title: "برنامه ریزی",
      writer: "ملیکا عزیزی",
      writerUrlImage: Assets.images.profile.path,
      date: "روز پیش 7",
      content: """
چند ماه پیش جدیدترین قسمت از مجموعه بازی‌های اساسینز کرید عرضه شد. بازی اساسینز کرید والهالا ماجرای قاتلان تاریخی را در سرزمین وایکینگ‌ها روایت می‌کند و تفاوت عظیمی با بازی‌های اصلی این سری دارد. البته چیزی که در این بازی حاضر هست و در دیگر بازی‌های این سری هم همیشه موجود بوده، حجم بالایی از محتوای مخفی و رازهای عجیب و غریب است. قصد داریم تا نگاهی به آن‌ها داشته باشیم تا در صورتی که آن‌ها را ندیده‌اید، غافل نمانید.

سری بازی‌های اساسینز کرید این روز‌ها شباهت بیش‌تری به بازی‌های نقش‌آفرینی دارند تا اساسینز کرید. گیم‌پلی این بازی‌ها تا حد زیادی تغییر کرده و المان‌های نقش‌آفرینی زیادی به آن‌ها اضافه شده. بازی اساسینز کرید والهالا همانند بازی‌های نقش‌آفرینی بسیار بزرگ شده و جارو کردن دنیای پهناور آن بیش‌تر از صد ساعت زمان می‌خواهد. در میان این نقشه‌ی بزرگ، نکات مخفی زیادی که در جوامع گیمرها به آن‌ها «ایستر اگ» (Easter Egg) گفته می‌شود وجود دارند.
""",
      view: "55"),
];
