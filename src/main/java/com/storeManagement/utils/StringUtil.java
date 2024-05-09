package com.storeManagement.utils;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Locale;

public class StringUtil {

    // Function to format the amount as currency
    public static String formatCurrency(double amount) {
        // Create a DecimalFormat instance for Vietnamese locale
        DecimalFormat formatter = (DecimalFormat) NumberFormat.getInstance(new Locale("vi", "VN"));
        // Set the pattern to format the number as currency
        formatter.applyPattern("#,###");
        // Format the amount
        return formatter.format(amount);
    }
}
