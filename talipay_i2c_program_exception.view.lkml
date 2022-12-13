view: talipay_i2c_program_exception {
  derived_table: {
    sql: select transaction_date, card_program_id as TaliPay_unknown_program from analytics_prod_talipay.i2c_posted where
      transaction_date = dateadd(day, -1, current_date)
      and card_program_id NOT IN ('TaliPayPayfareMFA',
      'TaliPay',
      'TaliPayMFA')
      group by transaction_date, card_program_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: transaction_date {
    type: date
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: talipay_unknown_program {
    type: string
    sql: ${TABLE}.talipay_unknown_program ;;
  }

  set: detail {
    fields: [transaction_date, talipay_unknown_program]
  }
}
