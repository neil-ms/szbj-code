package com.founder.cdr.batch.exception;

/**
 * 下列异常，终止当前step。
 * @author wen_ruichao
 * @see com.founder.cdr.batch.exception.database.DatabaseException
 * @see com.founder.cdr.batch.exception.mq.MQException
 * @see com.founder.cdr.batch.exception.mail.MailException
 */
public abstract class UnexpectedException extends CDRBatchException
{

    public UnexpectedException(String msg)
    {
        super(msg);
    }

    public UnexpectedException(String msg, Throwable cause)
    {
        super(msg, cause);
    }
}
