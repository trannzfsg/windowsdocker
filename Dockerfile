FROM microsoft/iis:latest
SHELL ["powershell"]

RUN Install-WindowsFeature NET-Framework-45-ASPNET ; \
    Install-WindowsFeature Web-Asp-Net45

COPY ./ /inetpub/wwwroot

EXPOSE 80

CMD Write-Host IIS Started... ; \
    while ($true) { Start-Sleep -Seconds 3600 }

# To run
# docker run --name windowsdocker -d -p 80:80 windowsdocker