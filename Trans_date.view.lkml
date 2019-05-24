view: Trans_date {
  derived_table: {
    sql: select max(Transaction_date) as Max_Transaction_date from analytics_prod_lyft.i2c_posted
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: max_transaction_date {
    type: date
    sql: ${TABLE}.Max_Transaction_date ;;
  }

  set: detail {
    fields: [max_transaction_date]
  }
}
