# TWRP-TEST-ZOOMVER
0. Первичная сборка прошла на 85% (почему-то?) (twrp запустился).GitHub написал, что сборка закончена и дал ссылку на скачивание (выставлены галочки в тёмных кругах).
1. Протестировал twrp, провожу работу над ошибками.
2. Заменил twrp.fstab (от донора).
3. Отредактировал twrp.fstab
4. Добавил в BoardConfig флаги:
Storage
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
5.   Сделал тестовую сборку. Сборка прошла на 100% (почему-то?).
GitHub написал, что сборка закончена и дал ссылку на скачивание (выставлены галочки в белых кругах).
6. Добавил в BoarConfig флаги:
TW_INTERNAL_STORAGE_PATH := "/storage/emulated/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/storage/sdcard0"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard"
7. Добавил vendor.prop
8. Сделал тестовую сборку.
9. Отредактировал twrp.fstab
10. Сделал тестовую сборку.
11. Тестовая сборка в купе со снятием шифрования (редактировал fstab vendor) заработала.
13. Добавил в recovery/root, файл ztecharger.
14. Отредактировал twrp.fstab
15. Довёл до ума twrp.fstab (все необходимые блоки готовы для backup).
16. Пересобрал twrp, необходимо тестировать создание backup и восстановление из него.
