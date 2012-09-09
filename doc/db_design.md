### Message has limited expired time

# Message id might be sha1 hash, createdDate + content
msg:next_id => the next id for `msg_id`

msg:<`msg_id`> => { id => `msg_id`, content => string, pw => string, expired => boolean }

# Those url are created by third party url shortening service, such as google and bit.ly.
msg:<`msg_id`>:links => list of url string


### SQL

entries ( id:integer, content:string, base64_id:string )

links ( id, uri:string, entry_id:integer )