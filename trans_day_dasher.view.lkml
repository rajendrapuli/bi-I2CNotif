view: trans_day_dasher {
  derived_table: {
    sql: select transaction_date as dasher_tr_date, count(id) as dasher_posted_records from analytics_prod_doordash.i2c_posted
    where transaction_date = dateadd(day, -1, date(sysdate))
    group by transaction_date
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: dasher_tr_date {
    type: date
    sql: ${TABLE}.dasher_tr_date ;;
  }

  dimension: dasher_posted_records {
    type: number
    sql: ${TABLE}.dasher_posted_records ;;
  }

  set: detail {
    fields: [dasher_tr_date, dasher_posted_records]
  }
}
