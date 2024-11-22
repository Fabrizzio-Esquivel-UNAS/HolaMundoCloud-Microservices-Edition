# Rutas de los servidores
$servers = @(
    @{ Name = "Microfrontend1"; Path = ".\microfrontend1"; Command = "npm start" },
    @{ Name = "Microfrontend2"; Path = ".\microfrontend2"; Command = "npm start" },
    @{ Name = "Microfrontend3"; Path = ".\microfrontend3"; Command = "npm start" },
    @{ Name = "Service1"; Path = ".\microservices\service1"; Command = "npm start" },
    @{ Name = "Service2"; Path = ".\microservices\service2"; Command = "npm start" },
    @{ Name = "Service3"; Path = ".\microservices\service3"; Command = "npm start" },
    @{ Name = "Container"; Path = ".\container"; Command = "npm start" }
)

# Función para abrir un nuevo proceso en una ventana separada
function Start-Server {
    param (
        [string]$Name,
        [string]$Path,
        [string]$Command
    )
    Write-Host "Starting $Name..."
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd $Path; $Command" -WindowStyle Normal
}

# Ejecutar todos los servidores
foreach ($server in $servers) {
    Start-Server -Name $server.Name -Path $server.Path -Command $server.Command
}
