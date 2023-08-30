namespace PartsUnlimited.Models
{
    public class CartItem : ILineItem
    {
        //My Second changes.
        [Key]
        public int CartItemId { get; set; }   
    }
}