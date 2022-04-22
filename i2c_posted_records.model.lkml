connection: "redshift_analytics"

include: "*.view.lkml"                       # include all views in this project
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

explore: trans_date_lyft
  {
  join: trans_day_dasher {
    type: left_outer
    relationship: one_to_one
    sql_on: ${trans_date_lyft.lyft_tr_date} = ${trans_day_dasher.dasher_tr_date} ;;
  }
    join: trans_day_talipay {
      type: left_outer
      relationship: one_to_one
      sql_on: ${trans_date_lyft.lyft_tr_date} = ${trans_day_talipay.talipay_tr_date} ;;
    }
}
