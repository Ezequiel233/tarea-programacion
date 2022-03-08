//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TF_Finanzas.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class Deuda
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Deuda()
        {
            this.cuotas = new HashSet<cuota>();
        }
    
        public int id { get; set; }
        [DisplayName("Activo")]
        public int id_bien { get; set; }
        [DisplayName("P.G")]
        public int id_periodo_gracia { get; set; }
        [DisplayName("Duracion del P.G")]
        [Range(0, 6,
            ErrorMessage = "El tiempo del P.G debe ser de 0 a maximo 6 cuotas")]
        public int PG_Tiempo { get; set; }
        [DisplayName("N° de Años")]
        [Range(1, 9,
            ErrorMessage = "El numero de años debe estar entre 1 y 9")]
        public int nro_años { get; set; }
        [DisplayName("Frecuencia de pago")]
        public int frecuencia { get; set; }
        [DisplayName("Dias por año")]
        [Range(360, 365,
            ErrorMessage = "El numero de dias por año debe ser 360 o 365")]
        public int dias_x_año { get; set; }
        [DisplayName("% de TEA")]
        [Range(0.0000001, 100.0000000,
            ErrorMessage = "El porcentaje de TEA no debe ser mayor a 100%")]
        public double TEA { get; set; }
        [DisplayName("% de IGV")]
        public double IGV { get; set; }
        [DisplayName("% de Impuesto a la renta")]

        public double i_renta { get; set; }
        [DisplayName("% de recompra")]
        public double recompra { get; set; }
        [DisplayName("Costes Notariales")]
        [Range(0,10000,
            ErrorMessage = "El Coste Notarial debe der 0 o mayor")]
        public decimal costo_notarial { get; set; }
        [DisplayName("Costes Registrales")]
        [Range(0, 10000,
            ErrorMessage = "El Coste Registral debe der 0 o mayor")]
        public decimal costo_registral { get; set; }
        [DisplayName("Tasación")]
        [Range(0, 10000,
            ErrorMessage = "La Tasación debe ser 0 o mayor")]
        public decimal tasacion { get; set; }
        [DisplayName("Comisión de estudio")]
        [Range(0, 10000,
            ErrorMessage = "La Comisión de Estudio debe ser 0 o mayor")]
        public decimal comision_de_estudio { get; set; }
        [DisplayName("Comisión de activación")]
        [Range(0, 10000,
            ErrorMessage = "La Comisión de activación debe ser 0 o mayor")]
        public decimal comision_de_activacion { get; set; }
        [DisplayName("Comision Periodica")]
        [Range(0.0000001, 10000,
            ErrorMessage = "La Comisión Periodica debe ser 0 o mayor")]
        public decimal comision_periodica { get; set; }
        [DisplayName("% de Seguro riesgo")]
        [Range(0.0000001, 100,
            ErrorMessage = "El % de Seguro de Riesgo es un campo obligatorio")]
        public double seguro_riesgo { get; set; }
        [DisplayName("Tasa de descuento Ks")]
        [Range(0.0000001, 100,
            ErrorMessage = "La Tasa de descuento Ks es un campo requerido")]
        public double tasa_ks { get; set; }
        [DisplayName("Tasa de descuento WACC")]
        [Range(0.0000001, 100,
            ErrorMessage = "La Tasa de descuento WACC es un campo requerido")]
        public double tasa_wacc { get; set; }
    
        public virtual Bien Bien { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<cuota> cuotas { get; set; }
        public virtual Periodo_gracia Periodo_gracia { get; set; }
    }
}