namespace PartsUnlimited.Models
{
    public class CartItem : ILineItem
    {
        //My first changes.
        [Key]
        public int CartItemId { get; set; }   
    }
}