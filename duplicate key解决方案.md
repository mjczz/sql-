## pgsql解决duplicate key

```sql
SELECT setval('nice_level_id_seq', (SELECT MAX(id) FROM nice_level)+1)
```