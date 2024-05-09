<?php

// DB connection to Supabase
$_db_ = pg_connect("host=supabase-db port=5432 dbname=postgres user=postgres password=your-super-secret-and-long-postgres-password") or die("An error occurred.\n");


