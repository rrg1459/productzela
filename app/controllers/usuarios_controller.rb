class UsuariosController < ApplicationController
  before_action :limpiar_carrito
  before_action :contador_articulos_carrito
  before_action :usuario_autorizado, except: [:new, :create]
  before_action :rol_autorizado, only: [:index, :otorgar, :revocar, :index_admin, :destroy]
  before_action :set_usuario, except: [:index_admin]
  before_action :set_usuario, only: [:comprar, :show, :edit, :otorgar, :revocar, :update, :destroy]

  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.where(rol: 'opera', f_eliminado: nil).order("celular")
  end

  def index_admin
    @usuarios = Usuario.where(rol: 'admin', f_eliminado: nil).order("celular")
    render :index_admin
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario           = Usuario.new(parametros_de_usuario)
    @usuario.celular   = params[:area] + params[:numero]
    @usuario.fh_sesion = Time.now.strftime("%Y%m%d%H%M")
    @usuario.f_creado  = Time.now
    @usuario.f_actualizado = Time.now

    celulart = params[:area] + params[:numero]
    respond_to do |format|
      if Usuario.exists?(celulart)
          @usuario = Usuario.find(celulart)
          if @usuario.f_eliminado == nil

              format.html { redirect_to usuarios_url,   notice: '*** ERROR usuario existe ***' }
          else
              format.html { redirect_to usuarios_url,   notice: '*** Advertencia: usuario eliminado por un administrador ***' }           
          end
      else
          if Usuario.any?
             @usuario.rol = 'opera'
          else
             @usuario.rol = 'admin'
          end
          if @usuario.save
              if session[:rol_usuario] == nil
                 session[:celular_usuario] = @usuario.celular
              end
              format.html { redirect_to @usuario, notice: '*** Cuenta creada ***' }
            else
              format.html { render :new }
              format.json { render json: @usuario.errors, status: :unprocessable_entity }
          end
      end
    end
  end

  def otorgar
    nombre = @usuario.nombre
    @usuario.update(rol: 'admin')
    redirect_to @usuario, notice: "#{nombre} es administrador desde este momento"
  end

  def revocar
    nombre = @usuario.nombre
    @usuario.update(rol: 'opera')
    redirect_to index_admin_url, notice: "#{nombre} es un usuario normal desde este momento"
  end

  def update
  # puts @usuario.inspect
    @usuario.f_actualizado = Time.now
    respond_to do |format|
      if @usuario.update(parametros_de_usuario)
         format.html { redirect_to @usuario, notice: 'El usuario fue editado' }
         format.json { render :show, status: :ok, location: @usuario }
      else
         format.html { render :edit }
         format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    nombre = @usuario.nombre
#   @usuario.destroy
    @usuario.update(f_eliminado: Time.now)

    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "*** #{nombre} fue borrado ***" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario        = Usuario.find(params[:celular])
      params[:area]   = @usuario.celular.to_s[0,4]
      params[:numero] = @usuario.celular.to_s[4,10]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parametros_de_usuario
      params.require(:usuario).permit(:celular, :contrasena, :rol, :nombre, :ubicacion, :correo, :gerencia, :telefono, :fh_sesion, :f_creado, :f_actualizado, :area)
    end

end