package com.zyd.blog.file.exception;

/**
 * @author dancoder
 * @version 1.0
 * @date 2018/12/5 17:15
 * @since 1.8
 */
public class QiniuApiException extends GlobalFileException {
    public QiniuApiException() {
        super();
    }

    public QiniuApiException(String message) {
        super(message);
    }

    public QiniuApiException(String message, Throwable cause) {
        super(message, cause);
    }

    public QiniuApiException(Throwable cause) {
        super(cause);
    }
}
