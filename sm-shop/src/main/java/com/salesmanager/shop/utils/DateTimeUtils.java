package com.salesmanager.shop.utils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public class DateTimeUtils {

    public static String formatDateTimeWithAdditionFormat(LocalDateTime dateTime, DateTimeFormatter formatter) {
        if (Objects.isNull(dateTime) || Objects.isNull(formatter)) {
            return null;
        }
        return dateTime.format(formatter);
    }
}
