# Encoding/Decoding

Both are done in the same [go package](https://pkg.go.dev/encoding@go1.24.2)

The formats available are:

- XML
- JSON
- CSV
- GOB
- Binary
- Base64
- Base32

Among others, not all of them use all the interfaces from below:

- BinaryAppender
- BinaryMarshaler
- BinaryUnmarshaler
- TextAppender
- TextMarshaler
- TextUnmarshaler
