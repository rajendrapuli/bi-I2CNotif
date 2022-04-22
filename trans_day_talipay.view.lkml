view: trans_day_talipay {
  derived_table: {
    sql: select transaction_date as talipay_tr_date, count(id) as talipay_posted_records from analytics_prod_talipay.i2c_posted
    where transaction_date = dateadd(day, -1, date(sysdate))
    group by transaction_date
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: talipay_tr_date {
    type: date
    sql: ${TABLE}.talipay_tr_date ;;
  }

  dimension: talipay_posted_records {
    type: number
    sql: ${TABLE}.talipay_posted_records ;;
  }

  set: detail {
    fields: [talipay_tr_date, talipay_posted_records]
  }
}
