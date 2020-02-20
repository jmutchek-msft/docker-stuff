# Hello Dotnet Dockerfile

FROM microsoft/dotnet:sdk

COPY ./bin/Release/netcoreapp2.1/publish/ hello-dotnet/

ENTRYPOINT ["dotnet", "hello-dotnet/hello-dotnet.dll"]
