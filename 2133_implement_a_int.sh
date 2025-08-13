#!/bin/bash

# Documentation for 2133_implement_a_int.sh

# Project: Implement an Interactive Blockchain dApp Analyzer

# Description:
# This script provides an interactive command-line interface for analyzing blockchain dApps.
# It allows users to input a dApp's contract address and retrieves relevant information,
# such as the dApp's balance, transaction history, and smart contract code.

# Functions:

# get_balance() - Retrieves the current balance of the dApp
get_balance() {
  echo "Enter the contract address: "
  read contract_address
  curl -X GET \
  https://api.blockchain.com/v3/contract/${contract_address}/balance \
  -H 'Content-Type: application/json'
}

# get_transaction_history() - Retrieves the transaction history of the dApp
get_transaction_history() {
  echo "Enter the contract address: "
  read contract_address
  curl -X GET \
  https://api.blockchain.com/v3/contract/${contract_address}/transactions \
  -H 'Content-Type: application/json'
}

# get_contract_code() - Retrieves the smart contract code of the dApp
get_contract_code() {
  echo "Enter the contract address: "
  read contract_address
  curl -X GET \
  https://api.blockchain.com/v3/contract/${contract_address}/code \
  -H 'Content-Type: application/json'
}

# Main Menu:
while true
do
  clear
  echo "Interactive Blockchain dApp Analyzer"
  echo "----------------------------------"
  echo "1. Get dApp Balance"
  echo "2. Get dApp Transaction History"
  echo "3. Get dApp Smart Contract Code"
  echo "4. Quit"
  echo -n "Choose an option: "
  read option

  case $option in
    1) get_balance ;;
    2) get_transaction_history ;;
    3) get_contract_code ;;
    4) exit ;;
    *) echo "Invalid option. Please choose a valid option." ;;
  esac
done