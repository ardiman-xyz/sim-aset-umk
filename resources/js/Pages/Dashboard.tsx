import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import { Head } from "@inertiajs/react";

export default function Dashboard() {
    return (
        <AuthenticatedLayout
            breadCrumbs={[
                {
                    title: "Dasbor",
                    url: "dashboard",
                    disabled: true,
                },
            ]}
        >
            <Head title="Dashboard" />
            <div>
                <h1 className="font-medium text-2xl">Admin Dashboard</h1>
            </div>
        </AuthenticatedLayout>
    );
}
