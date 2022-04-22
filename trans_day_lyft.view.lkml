view: trans_date_lyft {
  derived_table: {
    sql: select transaction_date as lyft_tr_date, count(id) as lyft_posted_records from analytics_prod_lyft.i2c_posted
    where transaction_date = dateadd(day, -1, date(sysdate))
    group by transaction_date
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: lyft_tr_date {
    type: date
    sql: ${TABLE}.lyft_tr_date ;;
  }

  dimension: lyft_posted_records {
    type: number
    sql: ${TABLE}.lyft_posted_records ;;
  }

  set: detail {
    fields: [lyft_tr_date, lyft_posted_records]
  }
}
