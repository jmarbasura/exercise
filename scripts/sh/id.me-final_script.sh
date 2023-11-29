#! /bin/bash

echo 01..
psql idme < /tmp/01-exercise01-adding_created_at_and_updated_at_columns.sql
echo 02..
psql idme < /tmp/02-exercise01-albums_table_data_type_conversions.sql
echo 03..
psql idme < /tmp/03-exercise01-users_table_data_type_conversions.sql
echo 04..
psql idme < /tmp/04-exercise01-albums_table_data_changes.sql
echo 05..
psql idme < /tmp/05-exercise01-streaming_plays_table_data_changes.sql
echo 06..
psql idme < /tmp/06-exercise01-moving_tables_to_music_schema.sql
echo 07..
psql idme < /tmp/07-exercise01-creating_tiers_in_lookup_schema_with_foreign_key.sql
echo 08..
psql idme < /tmp/08-exercise01-adding_sequences_to_users_and_albums_tables.sql
echo 09..
psql idme < /tmp/09-exercise01-data_type_changes_and_not_null_designations_for_albums_table.sql
echo 10..
psql idme < /tmp/10-exercise01-adding_unique_constraint_and_play_id_column_to_streaming_plays_table.sql
echo 11..
psql idme < /tmp/11-exercise01-creating_music_addresses_table_and_moving_data_from_users_table.sql
echo 12..
psql idme < /tmp/12-exercise02-creating_materialized_view_streaming_plays.sql
echo 13..
psql idme < /tmp/13-exercise03-partitioning_streaming_plays_table.sql
echo 14..
psql idme < /tmp/14-post_exercises-saving_orphaned_rows_and_adding_fk_constraints_to_streaming_plays_table.sql
echo 15..
psql idme < /tmp/15-post_exercises-running_analyze_command_on_tables.sql
