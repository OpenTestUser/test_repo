TRY. 
*  Открываем файл на запись: 
   OPEN DATASET lv_file FOR OUTPUT IN TEXT MODE ENCODING DEFAULT. 

*  Переносим данные в файл: 
   LOOP AT lt_extract INTO ls_record. 
      PERFORM sub_format_record CHANGING ls_record. 
      TRANSFER ls_record TO lv_file. 
   ENDLOOP. 

*  Закрываем файл: 
   CLOSE DATASET lv_file. 
CATCH cx_sy_file_access_error INTO lr_file_ex. 
*  Ошибки ввода, вывода (датасет в таком случае не открыт)... 
CATCH lcx_format_error INTO lr_format_ex. 
*  Обрабатываем свою внутренюю ошибку при форматировании...
*  при этом необходимо закрыть набор данных
   CLOSE DATASET lv_file. 
CLEANUP. 
*  В случае если возникнет не обработанное исключение закроем набор данных: 
   CLOSE DATASET lv_file. 
ENDTRY.