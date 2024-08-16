#!/bin/bash



# Main script logic
while true; do
    if [ "$CONNECTED" = true ]; then
        echo "Current database: $DB_DIR"
    else
        echo "No database connected."
    fi

    echo "Enter your choice:"
    echo "1. Create Database"
    echo "2. Delete Database"
    echo "3. List Databases"
    echo "4. Create Table"
    echo "5. List Tables"
    echo "6. Delete Table"
    echo "7. Add Row to Table"
    echo "8. List Rows in Table"
    echo "9. Delete Row from Table"
    echo "10. Connect to Database"
    echo "11. Disconnect from Database"
    echo "12. Exit"

    read -p "Enter your choice (1-12): " choice

    case $choice in
        1)
            create_database
            ;;
        2)
            delete_database
            ;;
        3)
            list_databases
            ;;
        4)
            create_table
            ;;
        5)
            list_tables
            ;;
        6)
            delete_table
            ;;
        7)
            add_row
            ;;
        8)
            list_rows
            ;;
        9)
            delete_row
            ;;
        10)
            connect_to_database
            ;;
        11)
            disconnect_from_database
            ;;
        12)
            echo "Exiting script."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 12."
            ;;
    esac
done
