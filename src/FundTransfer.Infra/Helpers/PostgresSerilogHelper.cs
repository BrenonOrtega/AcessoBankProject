using NpgsqlTypes;
using Serilog.Sinks.PostgreSQL;
using System.Collections.Generic;
using System.Collections.Immutable;

namespace FundTransfer.Infra.Helpers
{
    public static class PostgresSerilogHelper
    {
        public static readonly ImmutableDictionary<string, ColumnWriterBase> columnWriters = new Dictionary<string, ColumnWriterBase>()
        {
            {"message", new RenderedMessageColumnWriter(NpgsqlDbType.Text) },
            {"message_template", new MessageTemplateColumnWriter(NpgsqlDbType.Text) },
            {"level", new LevelColumnWriter(true, NpgsqlDbType.Varchar) },
            {"raise_date", new TimestampColumnWriter(NpgsqlDbType.Timestamp) },
            {"exception", new ExceptionColumnWriter(NpgsqlDbType.Text) },
            {"properties", new LogEventSerializedColumnWriter(NpgsqlDbType.Jsonb) },
            {"props_test", new PropertiesColumnWriter(NpgsqlDbType.Jsonb) },
            {"machine_name", new SinglePropertyColumnWriter("MachineName", PropertyWriteMethod.ToString, NpgsqlDbType.Text, "l") }
        }.ToImmutableDictionary();
    }
}