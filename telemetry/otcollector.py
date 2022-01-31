#!/usr/bin/python3

# otcollector.py

from opentelemetry import trace
from opentelemetry.exporter.otlp.proto.grpc.trace_exporter import (
            OTLPSpanExporter,
            )
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor

span_exporter = OTLPSpanExporter(
            # optional
                # endpoint="myCollectorURL:4317",
                    # credentials=ChannelCredentials(credentials),
                        # headers=(("metadata", "metadata")),
                        )
tracer_provider = TracerProvider()
trace.set_tracer_provider(tracer_provider)
span_processor = BatchSpanProcessor(span_exporter)
tracer_provider.add_span_processor(span_processor)

# Configure the tracer to use the collector exporter
tracer = trace.get_tracer_provider().get_tracer(__name__)

for x in range(1000):
    with tracer.start_as_current_span("foo"):
        with tracer.start_as_current_span("bar"):
            print("Hello world! ",x)
