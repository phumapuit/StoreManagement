package com.storeManagement.exception;

public class InvalidProductQuantityException extends RuntimeException {
    public InvalidProductQuantityException  (String errorMessage, Throwable err) {
        super(errorMessage, err);
    }
}