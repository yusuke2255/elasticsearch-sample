
## References
- [SQLとElasticsearchとのクエリの比較](https://qiita.com/NAO_MK2/items/630f2c4caa0e8a42407c)

## Indexの削除

```shell
curl -X DELETE "localhost:9200/jobs?pretty"
```

## Index Mappingの作成
```shell
curl -XPUT  "localhost:9200/jobs?pretty" -H "Content-Type: application/json" -d @query/jobs_mapping.json
```

## Mappingの確認
```shell
curl -X GET "localhost:9200/jobs/_mapping?pretty"
```

## IndexへDocumentを追加
```shell
curl -X PUT "localhost:9200/jobs/_doc/1?pretty&pretty" -H 'Content-Type: application/json' -d @data/job_1.json
curl -X PUT "localhost:9200/jobs/_doc/2?pretty&pretty" -H 'Content-Type: application/json' -d @data/job_2.json
```

## Count API

```shell
curl -X GET "localhost:9200/jobs/_count" -H 'Content-Type: application/json' -d @data/search.json
```

```json
{
  "query": {
    "bool": {
      "must": [
        {
          "term": {
            "job_tag_numbers": 1
          }
        },
        {
          "bool": {
            "should": [
              {
                "wildcard": {
                  "corporation.name": {
                    "value": "企業*"
                  }
                }
              },
              {
                "wildcard": {
                  "corporation.name": {
                    "value": "*2001*"
                  }
                }
              }
            ]
          }
        }
      ]
    }
  }
}
```