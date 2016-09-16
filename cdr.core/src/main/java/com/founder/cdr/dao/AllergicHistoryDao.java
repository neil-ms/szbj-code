package com.founder.cdr.dao;

import com.founder.cdr.dto.AllergicHistoryDto;
import com.founder.cdr.dto.risk.RiskListSearchPra;
import com.founder.fasf.core.util.daohelper.annotation.Arguments;
import com.founder.fasf.web.paging.PagingContext;

public interface AllergicHistoryDao
{
    /**
    *
    *[FUN]过敏/不良反应列表
    *@version 1.0, 2012/03/12
    *@author 黄洁玉
    *@since 1.0
    *
    */
    @Arguments({ "patientSn" })
    public AllergicHistoryDto[] selectAllergyList(String patientSn,
            PagingContext pagingContext);

    /**
    *
    *[FUN]过敏/不良反应列表
    *@version 1.0, 2012/03/12
    *@author 黄洁玉
    *@since 1.0
    *搜索
    *
    */
    @Arguments({ "patientSn", "riskListSearchPra" })
    public AllergicHistoryDto[] selectAllergyListSearch(String patientSn,
            RiskListSearchPra riskListSearchPra, PagingContext pagingContext);

}
