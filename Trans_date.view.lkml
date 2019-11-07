view: Trans_date {
  derived_table: {
    sql: select max(Transaction_date) as Max_Transaction_date,count(*) as Total_Rows from analytics_prod_lyft.i2c_posted where Transaction_date=( select max(Transaction_date) from analytics_prod_lyft.i2c_posted)
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

  dimension: total_rows {
    type: number
    sql: ${TABLE}.Total_Rows ;;
  }

  set: detail {
    fields: [max_transaction_date, total_rows]
  }
}
