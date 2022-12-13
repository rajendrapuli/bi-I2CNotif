connection: "redshift_analytics"

include: "/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: lyft_i2c_program_exception
  {
    join: dd_i2c_program_exception
    {
    type: left_outer
    relationship: one_to_one
    sql_on:${lyft_i2c_program_exception.transaction_date} = ${dd_i2c_program_exception.transaction_date}
    ;;
    }
    join: talipay_i2c_program_exception
    {
      type: left_outer
      relationship: one_to_one
      sql_on:${lyft_i2c_program_exception.transaction_date} = ${talipay_i2c_program_exception.transaction_date}
        ;;
    }
  }
