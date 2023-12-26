import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import { Head } from '@inertiajs/react';

export default function Dashboard() {
    return (
        <AuthenticatedLayout
            breadCrumbs={
                [
                    {
                        title : "Dasbor",
                        url: "dashboard",
                        disabled: true
                    },
                ]
            }
        >
            <Head title="Dashboard" />
            <div>
                you're login
            </div>
        </AuthenticatedLayout>
    );
}
