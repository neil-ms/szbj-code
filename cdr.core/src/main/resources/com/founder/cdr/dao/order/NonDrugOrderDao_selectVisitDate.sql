/**
 * $Author :jin_peng
 * $Date : 2012/11/22 13:26$
 * [BUG]0011026 MODIFY BEGIN
 * [FUN]V05-101非药物医嘱就诊日期查询条件
 */
SELECT RES.VISIT_SN, RES.VISIT_DATE || '(' || ACOL || ')' VISIT_DATE
  FROM (SELECT ROW_NUMBER() OVER(PARTITION BY TO_CHAR(MV.VISIT_DATE, 'YYYY-MM-DD') ORDER BY MV.VISIT_DATE DESC) ACOL,
               TO_CHAR(MV.VISIT_DATE, 'YYYY-MM-DD') VISIT_DATE,
               VISIT_SN
          FROM MEDICAL_VISIT MV
         WHERE MV.PATIENT_SN = /*patientSn*/
           AND MV.DELETE_FLAG = '0'
         ORDER BY MV.VISIT_DATE DESC) RES
/**[BUG]0011026 MODIFY END*/