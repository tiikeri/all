#!/bin/bash
## bank_manager: manually enter credits/debits and check account history
statement(){
cat statement.txt
}
math(){
	echo "scale=2; $1 $2 $3" | bc
}
accounts(){
	touch statement.txt
	touch cb.txt
	touch sb.txt
	touch bb.txt
	checkingBalance=`cat cb.txt`
	savingsBalance=`cat sb.txt`
	businessBalance=`cat bb.txt`
	allBalance=`math 0 + 0`
}
get_args(){
	echo "Enter transaction type. [debit/credit]"
	read type
	echo "Enter value of transaction. [x.xx]"
	read value
	echo "Enter recipient or sender of transaction."
	read other_party
	echo "Enter account to make this transaction to. [checking/savings/business]"
	read account
	echo "Enter date of transaction. (Skipping this will log the transaction with today's date.)"
	read date_of
	if [[ $date_of == "" ]] ; then
		date_of=$(date +%D)
	fi
}
	enterTransaction(){
	if [[ $type == "credit" ]] ; then transaction_prefix="\e[0;32m+\e[0m" ; tpr="+"  ; fi
	if [[ $type == "debit" ]] ; then transaction_prefix="\e[0;31m-\e[0m" ; tpr="-"  ; fi

	printf "Making transaction of $transaction_prefix\$$value to account \"$account\""
}
makeTransaction(){
	if [[ $type == "credit" ]] ; then
		if [[ $account == "checking" ]] ; then
			checkingBalance=`math $checkingBalance + $value`
		elif [[ $account == "savings" ]] ; then
			savingsBalance=`math $savingsBalance + $value`
		elif [[ $account == "business" ]] ; then
			businessBalance=`math $businessBalance + $value`
		fi
	elif [[ $type == "debit" ]] ; then
		if [[ $account == "checking" ]] ; then
			checkingBalance=`math $checkingBalance - $value`
		elif [[ $account == "savings" ]] ; then
			savingsBalance=`math $savingsBalance - $value`
		elif [[ $account == "business" ]] ; then
			businessBalance=`math $businessBalance - $value`
		fi
	fi
	echo -e "\nTransaction to $account account finished. Logging transaction..."
	echo "Your balances:"
	echo -e "Checking: \$$checkingBalance"
	echo -e "Savings: \$$savingsBalance"
	echo -e "Business: \$$businessBalance"

}
logTransaction(){
	echo "Transaction to $account account:" >> statement.txt
	if [[ $type == "credit" ]] ; then echo "From: $other_party |" >> statement.txt; fi
	if [[ $type == "debit" ]] ; then echo "To: $other_party |" >> statement.txt; fi
	echo -n "$tpr\$$value" >> statement.txt
	echo "Completed on $date_of" >> statement.txt
	echo "" >> statement.txt
	echo $businessBalance > bb.txt
	echo $checkingBalance > cb.txt
	echo $savingsBalance > sb.txt
}
if [[ $1 == "view-statement" ]] ; then statement ; exit 1 ; fi
accounts
get_args
enterTransaction
makeTransaction
logTransaction	
