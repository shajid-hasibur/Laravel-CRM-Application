<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Traits\Searchable;
use Illuminate\Database\Eloquent\Model;
use App\Constants\Status;

class WorkOrder extends Model
{
    use Searchable;
    use HasFactory;
    public function site()
    {
        return $this->belongsTo(CustomerSite::class, 'site_id', 'id');
    }
    public function customer()
    {
        return $this->belongsTo(Customer::class, 'slug', 'id');
    }
    public function invoice()
    {
        return $this->belongsTo(CustomerInvoice::class, 'id', 'work_order_id');
    }
    public function workPerform()
    {
        return $this->hasMany(workOrderPerformed::class, 'work_order_id', 'id');
    }
    public function technician()
    {
        return $this->belongsTo(Technician::class, 'ftech_id', 'id');
    }
    public function subTicket()
    {
        return $this->belongsTo(SubTicket::class, 'id', 'work_order_id');
    }
    //scope 
    public function scopeNewTicket($query)
    {
        return $query->where('status', Status::NEW);
    }
    public function scopeOpenTicket($query)
    {
        return $query->where('status', Status::OPEN);
    }
    public function scopeDispatchedTicket($query)
    {
        return $query->where('status', Status::DISPATCHED);
    }
    public function scopeOnsiteTicket($query)
    {
        return $query->where('status', Status::ONSITE);
    }
    public function scopeInvoicedTicket($query)
    {
        return $query->where('status', Status::INVOICED);
    }
    public function scopeOnholdTicket($query)
    {
        return $query->where('status', Status::ON_HOLD);
    }
    public function scopeClosedTicket($query)
    {
        return $query->where('status', Status::CLOSED);
    }
    public function scopePaidInvoice($query)
    {
        return $query->whereHas('invoice', function ($paid) {
            $paid->where('status', Status::PAID);
        });
    }
    public function scopeDueInvoice($query)
    {
        return $query->whereHas('invoice', function ($paid) {
            $paid->where('status', Status::UNPAID);
        });
    }
    public function scopeService($query)
    {
        return $query->where('order_type', Status::SERVICE);
    }
    public function scopeProject($query)
    {
        return $query->where('order_type', Status::PROJECT);
    }
    public function scopeInstall($query)
    {
        return $query->where('order_type', Status::INSTALL);
    }
}
