#!/bin/bash

# Default state
CONNECTED=false
DB_DIR=""

# Function to create a database
create_database() {
    read -p "Enter the database name: " db_name
    if [ -z "$db_name" ]; then
        echo "Database name cannot be empty."
        return 1
    fi

    if [ ! -d "$db_name" ]; then
        mkdir "$db_name"
        echo "Database '$db_name' created."
    else
        echo "Database '$db_name' already exists."
    fi
}



# Function to delete a database
delete_database() {
    read -p "Enter the database name to delete: " db_name
    if [ -z "$db_name" ]; then
        echo "Database name cannot be empty."
        return 1
    fi

    if [ -d "$db_name" ]; then
        echo "Are you sure you want to delete the database '$db_name'? (y/n)"
        read confirmation
        if [ "$confirmation" = "y" ] || [ "$confirmation" = "Y" ]; then
            rm -rf "$db_name"
            echo "Database '$db_name' deleted."
        else
            echo "Database deletion cancelled."
        fi
    else
        echo "Database '$db_name' does not exist."
    fi
}


# Function to list all databases
list_databases() {
    echo "Databases in the current directory:"
    for dir in */; do
        if [ -d "$dir" ]; then
            echo "${dir%/}"
        fi
    done
}

# Function to create a table
create_table() {
    if [ "$CONNECTED" = false ]; then
        echo "No database connected. Connect to a database first."
        return 1
    fi

    read -p "Enter the table name: " table_name
    if [ -z "$table_name" ]; then
        echo "Table name cannot be empty."
        return 1
    fi

    table_file="$DB_DIR/$table_name"

    if [ ! -f "$table_file" ]; then
        touch "$table_file"
        echo "Table '$table_name' created."
    else
        echo "Table '$table_name' already exists."
    fi
}

# Function to delete a table
delete_table() {
    if [ "$CONNECTED" = false ]; then
        echo "No database connected. Connect to a database first."
        return 1
    fi

    read -p "Enter the table name to delete: " table_name
    if [ -z "$table_name" ]; then
        echo "Table name cannot be empty."
        return 1
    fi

    table_file="$DB_DIR/$table_name"

    if [ -f "$table_file" ]; then
        rm "$table_file"
        echo "Table '$table_name' deleted."
    else
        echo "Table '$table_name' does not exist."
    fi
}

# Function to list tables in the current database
list_tables() {
    if [ "$CONNECTED" = false ]; then
        echo "No database connected. Connect to a database first."
        return 1
    fi

    echo "Tables in database '$DB_DIR':"
    ls "$DB_DIR"

}


# Function to add a row to a table
add_row() {
    if [ "$CONNECTED" = false ]; then
        echo "No database connected. Connect to a database first."
        return 1
    fi

    read -p "Enter the table name to add a row to: " table_name
    if [ -z "$table_name" ]; then
        echo "Table name cannot be empty."
        return 1
    fi

    table_file="$DB_DIR/$table_name"

    if [ -f "$table_file" ]; then
        read -p "Enter the data to add (comma-separated values): " data
        echo "$data" >> "$table_file"
        echo "Row added to table '$table_name'."
    else
        echo "Table '$table_name' does not exist."
    fi
}

# Function to list rows in a table
list_rows() {
    if [ "$CONNECTED" = false ]; then
        echo "No database connected. Connect to a database first."
        return 1
    fi

    read -p "Enter the table name to list rows from: " table_name
    if [ -z "$table_name" ]; then
        echo "Table name cannot be empty."
        return 1
    fi

    table_file="$DB_DIR/$table_name"

    if [ -f "$table_file" ]; then
        echo "Rows in table '$table_name':"
        cat "$table_file"
    else
        echo "Table '$table_name' does not exist."
    fi
}


# Function to delete a row from a table
delete_row() {
    if [ "$CONNECTED" = false ]; then
        echo "No database connected. Connect to a database first."
        return 1
    fi

    read -p "Enter the table name to delete a row from: " table_name
    if [ -z "$table_name" ]; then
        echo "Table name cannot be empty."
        return 1
    fi

    table_file="$DB_DIR/$table_name"

    if [ -f "$table_file" ]; then
        echo "Current rows in table '$table_name':"
        cat "$table_file"
        read -p "Enter the row to delete: " row_to_delete
        grep -v "^$row_to_delete$" "$table_file" > "${table_file}.tmp" && mv "${table_file}.tmp" "$table_file"
        echo "Row deleted from table '$table_name'."
    else
        echo "Table '$table_name' does not exist."
    fi
}



 Function to connect to a database
connect_to_database() {
    list_databases
    read -p "Enter the name of the database to connect to: " db_name
    if [ -z "$db_name" ]; then
        echo "Database name cannot be empty."
        return 1
    fi

    if [ -d "$db_name" ]; then
        DB_DIR="$db_name"
        CONNECTED=true
        echo "Connected to database '$DB_DIR'."
        echo "Current tables:"
        list_tables
    else
        echo "Database '$db_name' does not exist."
    fi
}

# Function to disconnect from the database
disconnect_from_database() {
    if [ "$CONNECTED" = true ]; then
        CONNECTED=false
        DB_DIR=""
        echo "Disconnected from the database."
    else
        echo "No database is currently connected."
    fi
}



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
