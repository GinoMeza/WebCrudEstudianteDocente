use BDAcademicoGino
go

-- Procedimientos almacenados para TDocente

if OBJECT_ID('spListarDocente') is not null
    drop proc spListarDocente
go
create proc spListarDocente
as
begin
    select * from TDocente
end
go

-- Procedimiento almacenado para agregar Docente
if OBJECT_ID('spAgregarDocente') is not null
    drop proc spAgregarDocente
go
create proc spAgregarDocente
@CodDocente char(5),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50),
@CodUsuario varchar(50)
as
begin
    if not exists(select CodDocente from TDocente where CodDocente = @CodDocente)
        if not exists(select CodUsuario from TUsuario where CodUsuario=@CodUsuario)
            begin
                begin tran tranAgregar 
                begin try
                    insert into TUsuario values(@CodUsuario,ENCRYPTBYPASSPHRASE('miFraseDeContraseña', 'password'))
                    insert into TDocente values(@CodDocente,@APaterno,@AMaterno,@Nombres,@CodUsuario)
                    commit tran tranAgregar
                    select CodError = 0, Mensaje = 'Docente insertado correctamente'
                end try
                begin catch
                    rollback tran tranAgregar
                    select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
                end catch
            end
        else select CodError = 1, Mensaje = 'Error: Usuario ya asignado en TUsuario'
    else select CodError = 1, Mensaje = 'Error: Codigo de Docente duplicado en la TDocente'
end
go

-- Procedimiento almacenado para eliminar un docente
if OBJECT_ID('spEliminarDocente') is not null
    drop proc spEliminarDocente
go
create proc spEliminarDocente
@CodDocente char(5)
as
begin
    if exists (select CodDocente from TDocente where CodDocente=@CodDocente)
    begin
        declare @CodUsuario varchar(50)
        set @CodUsuario = (select CodUsuario from TDocente where CodDocente = @CodDocente)
        if exists (select CodUsuario from TUsuario where CodUsuario = @CodUsuario)
        begin
            begin tran tranEliminar
            begin try
                delete from TDocente where CodDocente = @CodDocente
                delete from TUsuario where CodUsuario = @CodUsuario
                commit tran tranEliminar
                select CodError = 0, Mensaje = 'Docente eliminado correctamente'
            end try
            begin catch
                rollback tran tranEliminar
                select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
            end catch
            end			
        else select CodError = 1, Mensaje = 'Error: No existe CodUsuario en la TUsuario'		
    end
    else select CodError = 1, Mensaje = 'Error: CodDocente no existe en la TDocente'
end
go

-- Procedimiento almacenado para buscar un docente
if OBJECT_ID('spBuscarDocente') is not null
    drop proc spBuscarDocente
go
create proc spBuscarDocente
@CodDocente char(5)
as
begin
    if exists (select CodDocente from TDocente where CodDocente = @CodDocente)
    begin
        select CodDocente, APaterno, AMaterno, Nombres, CodUsuario
        from TDocente
        where CodDocente = @CodDocente
    end
    else
    begin
        select CodError = 1, Mensaje = 'Error: CodDocente no existe en la TDocente'
    end
end
go

-- Procedimiento almacenado para actualizar un docente
if OBJECT_ID('spActualizarDocente') is not null
    drop proc spActualizarDocente
go
create proc spActualizarDocente
@CodDocente char(5),
@APaterno varchar(50),
@AMaterno varchar(50),
@Nombres varchar(50)
as
begin
    if exists (select CodDocente from TDocente where CodDocente = @CodDocente)
    begin
        begin tran tranActualizar
        begin try
            update TDocente
            set APaterno = @APaterno, AMaterno = @AMaterno, Nombres = @Nombres
            where CodDocente = @CodDocente
            commit tran tranActualizar
            select CodError = 0, Mensaje = 'Docente actualizado correctamente'
        end try
        begin catch
            rollback tran tranActualizar
            select CodError = 1, Mensaje = 'Error: No se ejecuto la transaccion'
        end catch
    end
    else
    begin
        select CodError = 1, Mensaje = 'Error: CodDocente no existe en la TDocente'
    end
end
go
