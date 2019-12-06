package com.zyd.blog.file.exception;

/**
 * @author dancoder
 * @version 1.0
 * @date 2018/12/5 17:15
 * @since 1.8
 */
public class LocalApiException extends GlobalFileException {
    public LocalApiException() {
        super();
    }

    public LocalApiException(String message) {
        super(message);
    }

    public LocalApiException(String message, Throwable cause) {
        super(message, cause);
    }

    public LocalApiException(Throwable cause) {
        super(cause);
    }
}
