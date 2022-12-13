view: dd_i2c_program_exception {
  derived_table: {
    sql: select transaction_date, card_program_id as Doordash_unknown_program from analytics_prod_doordash.i2c_posted where
      transaction_date = dateadd(day, -1, current_date)
      and card_program_id NOT IN ('DasherDirect',
      'DasherDirectDoshMFA',
      'DasherDirectSavings',
      'DasherPayfareMFA',
      'DasherDirectRewards',
      'AutoDasherDirectMFA')
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

  dimension: doordash_unknown_program {
    type: string
    sql: ${TABLE}.doordash_unknown_program ;;
  }

  set: detail {
    fields: [transaction_date, doordash_unknown_program]
  }
}
